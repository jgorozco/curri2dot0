package com.igz.curri2.ui 
{
	import com.greensock.TweenLite;
	import com.igz.curri2.frwk.ProyectDto;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.LinkUi;
	/**
	 * ...
	 * @author 
	 */
	public class ProyectUi extends Sprite
	{
		public  var $HeaderHeight:Number;
		public  var $CompleterHeight:Number;
		public var $Showed:Boolean;
		private var _ShowBtn:LinkUi;
		
		public function ProyectUi() 
		{
			$Showed = false;
			$HeaderHeight = 40;
			$CompleterHeight = 300;
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0XD1D1D1);
			s.graphics.lineStyle(1, 0X666666, 1, true);
			s.graphics.moveTo(0, 0);
			s.graphics.curveTo(Fleaxy.$Current.$Stage.stageWidth / 2, -60 , Fleaxy.$Current.$Stage.stageWidth, 0);
			s.graphics.lineTo(Fleaxy.$Current.$Stage.stageWidth, 300);
			s.graphics.lineTo(0, 300);
			s.graphics.lineTo(0,0);
			//s.graphics.drawRect(0, 0, Fleaxy.$Current.$Stage.stageWidth, 300);
			s.graphics.endFill();
			addChild(s);

			
			var btn_show:Sprite;
			btn_show = new Sprite();
			btn_show.graphics.beginFill(0X666666);
			btn_show.graphics.drawEllipse(0, 0, 150, 80);
			//btn_show.graphics.drawRect(0, 0, 80, 40);
			btn_show.graphics.endFill();
			_ShowBtn = new LinkUi(btn_show, { "onClick":_OnClickShow } );
			addChild(_ShowBtn);
			swapChildren(s,_ShowBtn);
			$Recolocate();
		}
		
		private function _OnClickShow(e:MouseEvent):void 
		{
			var p:Number;
			if ($Showed)//ocultamos
			{
				p = this.y + 220;
				TweenLite.to(this, 0.7, { y: p /*,onComplete:_ChangeText */} );
			}
			else
			{
				 p = this.y - 220;
				TweenLite.to(this, 0.7, { y: p /*, onComplete:_ChangeText */} );		
				//$LoadPersonalData(null);
			}
			$Showed = !$Showed;
		}
		
		public function $Recolocate():void
		{
			
			_ShowBtn.y = -50;
			_ShowBtn.x = ( this.width - _ShowBtn.width)/2;
		}
		
		public function $SetArrayProyects(p_arr:Array):void
		{
			var proyect:ProyectDto;
			for (var i:Number = 0, i < p_arr.length; i++)
			{
				
			}
			
		}
		
		
	}

}