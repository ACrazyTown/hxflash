package animate.structs;

using StringTools;

class SolidColor
{
    public var color:Int;
    public var alpha:Float;

    public function new(?color:Int = 0, ?alpha:Float = 0)
    {
        this.color = color;
        this.alpha = alpha;
    }

    public static function fromHex(hex:String):SolidColor
    {
        // probaly not the best way to parse these but i'll take it for now
        var trimmed = hex.replace("0x", "").replace("#", "");
        var c = Std.parseInt("0x" + hex.substr(0, 6));
        var a = 1.0;
        if (hex.length > 8)
            a = 1 / Std.parseInt("0x" + hex.substr(6, 8));

        return new SolidColor(c, a);
    }
}