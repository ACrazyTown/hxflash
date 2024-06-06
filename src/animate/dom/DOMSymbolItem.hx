package animate.dom;

import haxe.xml.Access;

class DOMSymbolItem
{
    public var name(default, null):String;
    public var itemID(default, null):String;
    public var lastModified(default, null):String;

    public var timeline(get, never):DOMTimeline;
    private inline function get_timeline():DOMTimeline
        return timelines.length > 0 ? timelines[0] : null; // idk if i need this fialsafe

    public var timelines:Array<DOMTimeline> = [];

    public function new(xmlData:String)
    {
        //trace(xmlData);

        var _xml:Xml = Xml.parse(xmlData);
        var _access:Access = new Access(_xml);
        
        var dsi = _access.node.resolve("DOMSymbolItem");
        this.name = dsi.att.resolve("name");
        this.itemID = dsi.att.resolve("itemID");
        this.lastModified = dsi.att.resolve("lastModified");

        // TODO parse timeline
    }
}