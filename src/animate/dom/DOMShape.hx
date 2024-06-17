package animate.dom;

import animate.structs.SolidColor;
import animate.structs.Edge;
import animate.structs.FillStyle;
import haxe.xml.Access;

class DOMShape extends BaseDOMItem
{
    public var fills(default, null):Array<FillStyle> = [];
    public var edges(default, null):Array<Edge> = [];

    public function new(project:XFLProject, xmlData:String) 
    {
        super(project);

        //trace(xmlData);

        var access:Access = new Access(Xml.parse(xmlData));
        var ds:Access = access.node.resolve("DOMShape");

        for (fill in ds.nodes.resolve("fills"))
        {
            //trace(fill.innerHTML);
            if (fill.hasNode.resolve("FillStyle"))
            {
                for (fillStyle in fill.nodes.resolve("FillStyle"))
                {
                    var fs:FillStyle = {};

                    if (fillStyle.has.resolve("index"))
                        fs.index = Std.parseInt(fillStyle.att.resolve("index"));

                    if (fill.hasNode.resolve("SolidColor"))
                    {
                        var solidColor:Access = fill.node.resolve("SolidColor");
                        var sc:SolidColor = {color: null};

                        if (solidColor.has.resolve("color"))
                            sc.color = solidColor.att.resolve("color");

                        fs.data = sc;
                    }
                }
            }
        }

        for (edges in ds.nodes.resolve("edges"))
        {
            for (edge in edges.nodes.resolve("Edge"))
            {
                var _edge:Edge = {};

                if (edge.has.resolve("fillStyle0"))
                    _edge.fillStyle0 = edge.att.resolve("fillStyle0");
                if (edge.has.resolve("fillStyle1"))
                    _edge.fillStyle1 = edge.att.resolve("fillStyle1");
                if (edge.has.resolve("edges"))
                    _edge.edges = edge.att.resolve("edges");
                if (edge.has.resolve("cubics"))
                    _edge.cubics = edge.att.resolve("cubics");

                this.edges.push(_edge);
            }
        }

        //trace(this.edges);
    }
}