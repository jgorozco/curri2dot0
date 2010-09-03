package com.igz.curri2 {
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.net.Comm;
	import igz.fleaxy.events.CommEvent;
	import com.igz.curri2.ui.Gui;

	/**
	 * ...
	 * @author josevk
	 */
	public class Frwk {

		static protected var _Current:Frwk;
		static public function get $Current() : Frwk {
			if ( _Current == null ) {
				_Current = new Frwk();
			}
			return _Current;
		}

		public function Frwk() : void {

		}

		public function $Init() : void {

		}

	}

}