package;

import animate.objects.Symbol;
import animate.XFLProject;
//import haxe.ui.macros.ComponentMacros;
//import haxe.ui.core.Component;
//import haxe.ui.Toolkit;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		//Toolkit.init();

		var xfl = new XFLProject("assets/xfls/DOGBOP");

		var symbol:Symbol = new Symbol(cast xfl.document.symbols.get("dog head base").timeline.layer.frames[0].elements[0]);
		addChild(symbol);
		//var c = ComponentMacros.
	}
}
