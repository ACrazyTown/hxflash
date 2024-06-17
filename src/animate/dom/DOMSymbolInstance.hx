package animate.dom;

import openfl.geom.Point;
import openfl.geom.Matrix;
import animate.structs.LoopType;
import animate.structs.SymbolType;
import haxe.xml.Access;

/*
<DOMSymbolInstance libraryItemName="Dog Dance ONBEAT" selected="true" symbolType="graphic" loop="loop">
                                             <matrix>
                                                  <Matrix a="1.06936645507813" d="1.06936645507813" tx="144" ty="154.45"/>
                                             </matrix>
                                             <transformationPoint>
                                                  <Point x="-34.6" y="-51.25"/>
                                             </transformationPoint>
                                        </DOMSymbolInstance>
                                        */

class DOMSymbolInstance extends BaseDOMItem
{
    public var libraryItemName(default, null):String;
    public var selected(default, null):Bool;
    public var symbolType(default, null):SymbolType;
    public var loop(default, null):LoopType;

    public var matrix:Matrix = null;
    public var transformationPoint:Point = null;

    public function new (project:XFLProject, xmlData:String)
    {
        super(project);

        var access:Access = new Access(Xml.parse(xmlData));
        var dsin:Access = access.node.resolve("DOMSymbolInstance");

        if (dsin.has.resolve("libraryItemName"))
            libraryItemName = dsin.att.resolve("libraryItemName");
        if (dsin.has.resolve("selected"))
            selected = dsin.att.resolve("selected").toLowerCase() == "true";
        if (dsin.has.resolve("symbolType"))
            symbolType = dsin.att.resolve("symbolType");
        if (dsin.has.resolve("loop"))
            loop = dsin.att.resolve("loop");
        
        if (access.hasNode.resolve("matrix"))
        {
            /*
            matrix = new Matrix();
            var mdata:Access = access.node.resolve("matrix").node.resolve("Matrix");
            if (mdata.has.resolve("a"))
                matrix.a = Std.parseFloat(mdata.att.resolve("a"));
            if (mdata.has.resolve("d"))
                matrix.d = Std.parseFloat(mdata.att.resolve("d"));
            if (mdata.has.resolve("tx"))
                matrix.tx = Std.parseFloat(mdata.att.resolve("tx"));
            if (mdata.has.resolve("ty"))
                matrix.ty = Std.parseFloat(mdata.att.resolve("ty"));
            */
            matrix = Util.xmlToOpenFLMatrix(access.node.resolve("matrix").node.resolve("Matrix"));
        }

        if (access.hasNode.resolve("transformationPoint"))
        {
            transformationPoint = new Point();
            var pdata:Access = access.node.resolve("transformationPoint").node.resolve("Point");
            if (pdata.has.resolve("x"))
                transformationPoint.x = Std.parseFloat(pdata.att.resolve("x"));
            if (pdata.has.resolve("y"))
                transformationPoint.y = Std.parseFloat(pdata.att.resolve("y"));
        }

        // todo: filter
    }
}