package animate.objects;

import openfl.display.Graphics;
import animate.structs.SolidColor;
import animate.structs.FillStyle;
import animate.structs.Edge;
import openfl.display.Sprite;
import animate.dom.DOMShape;

/**
 * This represents a Symbol like in Flash.
 * The difference between this and DOMSymbolItem is that DOMSymbolItem simply stores all the data, this class handles all the rendering and logic in the OpenFL game loop.
 */

// https://stackoverflow.com/questions/4077200/whats-the-meaning-of-the-non-numerical-values-in-the-xfls-edge-definition
// https://github.com/SasQ/SavageFlask/blob/master/doc/FLA.txt
typedef RenderCommand = Graphics->Void;

class Symbol extends Sprite
{
    public function new(_shape:DOMShape)
    {
        super();

        var _fills = parseFillStyles(_shape.fills);

        for (edge in _shape.edges)
        {
            parseDrawCommand(edge);
        }
    }

    function parseFillStyles(fillStyles:Array<FillStyle>):Array<RenderCommand>
    {
        var commands:Array<RenderCommand> = [];

        for (style in fillStyles)
        {
            /*
            //throws SolidColor is not a value... prolly need to restructure!
            if (Std.isOfType(style.data, SolidColor))
            {
                
            }
            */
        }

        return commands;
    }

    function parseLineStyle()
    {
    
    }

    function parseDrawCommand(edge:Edge)
    {
        //var 
    }
}
