package com.igz.curri2 {
	import com.igz.curri2.frwk.PersonalDataDto;
	import com.igz.curri2.frwk.ProyectDto;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.net.Comm;
	import igz.fleaxy.events.CommEvent;
	import com.igz.curri2.ui.Gui;
	import igz.fleaxy.net.CommResponseType;

	/**
	 * ...
	 * @author josevk
	 */
	public class Frwk {

		public var $PersonalData:PersonalDataDto;
		public var $ArrayProyects:Array;
		public var $Categories:Array;
		private var _onCompleteLoad:Function;
		
		static protected var _Current:Frwk;
		static public function get $Current() : Frwk {
			if ( _Current == null ) {
				_Current = new Frwk();
			}
			return _Current;
		}

		public function Frwk() : void {

		}

		public function $Init(p_complete:Function ) : void {
			_onCompleteLoad = p_complete;
			Comm.$Get("userData.json", { onComplete:_OnCompleteLoad } );
		}
		
		private function _OnCompleteLoad(p_event:CommEvent):void
		{
			if (p_event.$CommResponseType==CommResponseType.$JSON)
			{
			$PersonalData = new PersonalDataDto();
			$PersonalData.$LoadFromJson(p_event.$ResponseJSON.Data.UserData);
			$ArrayProyects = new Array();
			$Categories
			
			var arr:Array = (p_event.$ResponseJSON.Data.Proyects as Array);
			var aux:ProyectDto;
			for each (var itm:Object in arr) 
				{
					aux = new ProyectDto();
					aux.$LoadFromJson(itm);
					$ArrayProyects.push(aux);
				}
			}
			_onCompleteLoad();
		}
	}
}