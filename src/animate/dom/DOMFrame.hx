package animate.dom;

import haxe.xml.Access;

class DOMFrame extends BaseDOMItem
{
    public var index(default, null):Int = 0;
    public var duration(default, null):Int = 0;
    // keyMode

    //var elements:Array<Dynamic> = [];

    public function new(project:XFLProject, xmlData:String)
    {
        super(project);

        var access:Access = new Access(Xml.parse(xmlData));
        var df:Access = access.node.resolve("DOMFrame");

        this.index = Std.parseInt(df.att.resolve("index"));
        this.duration = Std.parseInt(df.att.resolve("duration"));

        // todo parse DOMShape
    }
}