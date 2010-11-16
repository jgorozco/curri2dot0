package com.igz.curri2.ui 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	/**
	 * ...
	 * @author ...
	 */
	public class TimeLineUi extends Sprite
	{
		public var $Bg:Sprite;
		private var _CategorieList:CategoriesUi;
		public var $Timeline:Sprite;
		private var _Selector:LinkUi;
		private var _DateInit:LabelUi;
		private var _DateFinish:LabelUi;
		private var _MaxHeight:Number;
		private var _selectorActualPercent:Number;
		private var _SelectorPushed:Boolean;
		private var _localX:Number;
		
		public function TimeLineUi(p_categorie:CategoriesUi=null) 
		{
			$Bg = new Sprite();
			$Bg.graphics.beginFill(0xffff055);
			$Bg.graphics.drawRect(0, 0, 500, p_categorie.height);
			$Bg.graphics.endFill();
			addChild($Bg);
			_MaxHeight = 500;
			_SelectorPushed = false;
			_localX = 0;
			if (p_categorie != null)
			{
				_SetCategorie(p_categorie);	
				_MaxHeight = Fleaxy.$Current.$Stage.stageWidth - (_CategorieList.width + _CategorieList.x)+_CategorieList.$BtnMedidas.x	;			
			}
			trace("CREATING TIMELINE");
			$Timeline = new Sprite();
			$Timeline.graphics.beginFill(0x00ff00,0);
			$Timeline.graphics.drawRect(0, 0, _MaxHeight * 0.9, 40);
			$Timeline.graphics.endFill();
			var _LineOfTimeline:Sprite = new Sprite();
			_LineOfTimeline.graphics.beginFill(0x00ff00);
			_LineOfTimeline.graphics.drawRect(0, 0, _MaxHeight * 0.9,3);
			_LineOfTimeline.graphics.endFill();
			_LineOfTimeline.y = ($Timeline.height-_LineOfTimeline.height) / 2;
			$Timeline.addChild(_LineOfTimeline);
			addChild($Timeline);
			var clicked:Sprite = new Sprite();
			clicked.graphics.beginFill(0x0000ff);
			clicked.graphics.drawRect(0, 0, 10, 40);
			clicked.graphics.endFill();
			var scr:Sprite = new Sprite()
/*			scr.graphics.beginFill(0x0000ff99);
			scr.graphics.drawRect(0, 0, 40, 40);
			scr.graphics.endFill();	
			scr.addChild(clicked);
			clicked.x = (scr.width-clicked.width)/2;*/
			_Selector = new LinkUi(clicked, { "onMouseDown" : _OnSelectorMouseDown
											, "onMouseUp"   : _OnSelectorMouseUp 
											, "onMouseMove"   : _OnSelectorMouseUp 
											} 
								  );
			_selectorActualPercent = 0;
			addChild(_Selector);
			
			
			_resizeTimeline();
		}
		
		
		

		
		private function _OnSelectorMouseDown(p_event:MouseEvent):void
		{
			_SelectorPushed = true;
			var Rec:Rectangle = $Timeline.getRect(this);
			Rec.height = 0;
			_Selector.startDrag(false,Rec );
			trace("mouseDown");
			_localX = p_event.stageX;
			
		}

		private function _OnSelectorMouseUp(p_event:MouseEvent):void
		{
			_SelectorPushed = true;
			_Selector.stopDrag();
			_selectorActualPercent = _Selector.x / _MaxHeight;
			trace("_OnSelectorMouseUp");
		}		
		
		private function _SetCategorie(p_categorie:CategoriesUi):void
		{
		_CategorieList = p_categorie;	
		
		}		
		
		public function $SetCategorie(p_categorie:CategoriesUi):void
		{
		_SetCategorie(p_categorie);
		//TODO añadir los textos de las fechas.
		_resizeTimeline();
		}
		
		private function _resizeTimeline():void
		{
		trace("_resizeTimeline: with extra::"+_CategorieList.$BtnMedidas.x);
		_MaxHeight = Fleaxy.$Current.$Stage.stageWidth - (_CategorieList.width + _CategorieList.x)+_CategorieList.$BtnMedidas.x	;
		$Bg.width = _MaxHeight;
		$Timeline.width = _MaxHeight * 0.9;
		$Timeline.y = (this.height - $Timeline.height) / 2;
		$Timeline.x = _MaxHeight * 0.05;
		_Selector.y = $Timeline.y + (_Selector.height - $Timeline.height) / 2;
		_Selector.x = $Timeline.x + (_selectorActualPercent*$Timeline.width);
		
		}
		
	}

}