package animate.dom;

import haxe.xml.Access;

class DOMLayer extends BaseDOMItem
{
    public var name(default, null):String;
    public var color(default, null):String;
    // current, isSelected

    public var frames:Array<DOMFrame> = [];

    public function new(project:XFLProject, xmlData:String)
    {
        super(project);

        var access:Access = new Access(Xml.parse(xmlData));
        var dl:Access = access.node.resolve("DOMLayer");

        this.name = dl.att.resolve("name");
        this.color = dl.att.resolve("color");

        for (frame in dl.nodes.resolve("frames"))
        {
            var df:DOMFrame = new DOMFrame(_project, frame.innerHTML);
            frames.push(df);
        }
    }
}