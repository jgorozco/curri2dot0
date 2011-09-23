package com.igz.curri2.ui {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	import igz.fleaxy.Fleaxy;

	/**
	 * ...
	 * @author josevk
	 */
	public class Gui {

		static protected var _Current:Gui;
		static public function get $Current() : Gui {
			if ( _Current == null ) {
				_Current = new Gui();
			}
			return _Current;
		}

		public var MainWindow:MainWindowUi;
		
		public function Gui() : void {

			Fleaxy.$Current.$Stage.addEventListener(Event.RESIZE, _Stage_OnResize);
		}

		public function $Init() : void {
			trace("iniciado");
			MainWindow = new MainWindowUi();
			Fleaxy.$Current.$Stage.addChild(MainWindow);
			
		}

		
		protected function _Autoposition() : void {
			// Fleaxy.$Current.$Stage.stageWidth
			// Fleaxy.$Current.$Stage.stageHeight
		}

		protected function _Stage_OnResize(p_event:Event):void {
			_Autoposition();
		}

	}

}