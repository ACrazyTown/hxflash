package animate;

import haxe.xml.Access;
import openfl.geom.Matrix;

class Util
{
    inline public static function xmlToOpenFLMatrix(matrixData:Access):Matrix
    {
        var matrix:Matrix = new Matrix();
        if (matrixData.has.resolve("a"))
            matrix.a = Std.parseFloat(matrixData.att.resolve("a"));
        if (matrixData.has.resolve("d"))
            matrix.d = Std.parseFloat(matrixData.att.resolve("d"));
        if (matrixData.has.resolve("tx"))
            matrix.tx = Std.parseFloat(matrixData.att.resolve("tx"));
        if (matrixData.has.resolve("ty"))
            matrix.ty = Std.parseFloat(matrixData.att.resolve("ty"));
        return matrix;
    }
}