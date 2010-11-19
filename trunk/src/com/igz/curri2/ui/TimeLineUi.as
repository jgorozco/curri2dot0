package com.igz.curri2.ui 
{
	import com.igz.curri2.Frwk;
	import com.igz.curri2.frwk.CategoryDto;
	import com.igz.curri2.frwk.ProyectDto;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import mx.formatters.DateFormatter;
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
		private var _DateSelected:LabelUi;
		private var _DateFinish:LabelUi;
		private var _MaxHeight:Number;
		private var _selectorActualPercent:Number;
		private var _SelectorPushed:Boolean;
		private var _localX:Number;
		private var _DifMonths:Number;
		private var _LocalProyects:Array;
		private var _InitialDate:Date;
		private var _EndDate:Date;
		private var _SelectedDate:Date;
		
		private var df:DateFormatter;
		
		
		private var _MapLines:Object;
		
		public function TimeLineUi(p_categorie:CategoriesUi=null) 
		{
			df= new DateFormatter();
			df.formatString = "MM-YYYY";
			$Bg = new Sprite();
			_EndDate = new Date();
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
			_LineOfTimeline.y = ($Timeline.height - _LineOfTimeline.height) / 2;
			$Timeline.addChild(_LineOfTimeline);
			addChild($Timeline);
			_DateSelected= new LabelUi("1/1/2001", "");
			_DateInit = new LabelUi("1/1/2001", "");
			_DateFinish = new LabelUi("1/1/2011", "");
			addChild(_DateInit);
			addChild(_DateFinish);
			var clicked:Sprite = new Sprite();
			clicked.graphics.beginFill(0x0000ff);
			clicked.graphics.drawRect(0, 0, 10, 40);
			clicked.graphics.endFill();
			_Selector = new LinkUi(clicked, { "onMouseDown" : _OnSelectorMouseDown
											, "onMouseUp"   : _OnSelectorMouseUp 
											, "onMouseMove"   : _OnSelectorMouseMove
											} 
								  );
			_selectorActualPercent = 0;
			addChild(_Selector);
			clicked.addChild(_DateSelected);
			_DateSelected.x =  -(_DateSelected.width / 2);
			_DateSelected.y =  - 20;
			_resizeTimeline();

		}
		
		
		
		private function _OnSelectorMouseMove(p_event:MouseEvent):void
		{
			if (p_event.buttonDown)
			{
				var eax:Number =(-1)* (-_Selector.x+$Timeline.x ) / $Timeline.width;
				_SetCurrentDate(eax);
			}
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
			_MapLines = new Object();
			_SetCategorie(p_categorie);
			var categories:Array = p_categorie.$GetCategories();
			var category:CategoryDto;
			var count:Number = 0;
			_EndDate = new Date();
			_InitialDate = Frwk.$Current.$PersonalData.DateInit;
			_SelectedDate = new Date( _InitialDate);
			_DifMonths = ((_EndDate.fullYear - _InitialDate.fullYear) * 12) + (_EndDate.getMonth() - _InitialDate.getMonth());
	
			_LocalProyects = new Array();
			var auxArray:Array;
				for (count = 0; count < categories.length; count++)
			{
				category = (categories[count] as CategoryDto);
				auxArray = Frwk.$Current.$GetProyectFromCategorie(category);
				_CreateMapFromCategorie(category.$Name,auxArray);
				auxArray.concat(_LocalProyects);
				_LocalProyects = auxArray;
			}		
			var inn:int = 0;	
			var actualp:ProyectDto;
		
			
			_DateInit.text = df.format(_InitialDate);
			_DateFinish.text =  df.format(_EndDate);
			_DateSelected.text=df.format(_SelectedDate);
		
			_resizeTimeline();
		}
		
		private function _CreateMapFromCategorie(p_categorie:String, p_proyects:Array ):void
		{
			//TODO COGEMOS UNA CATEGORIA Y UN ARRAY DE PROYECTOS
			// y por cada mes entre este mes y la diferencia de meses sumamos uno en plan
			//[ 0,0,0,1,1,1,1,2,2,2,2,2,1,1,1] por cada proyecto  en esta tecnologia, por ejemplo 
			//lo de antes seria, al principio ningun proyecto, luego 1 luego 2  y luego 1 de nuevo
		}
		
		private function _SetCurrentDate(p_number:Number):void
		{
			var actMonth:Number = Math.round(_DifMonths * p_number);
			var meses:Number = _InitialDate.getMonth() + actMonth;
			var anios:Number = ((meses+1) / 12)+ _InitialDate.getFullYear();
			_SelectedDate.setMonth((meses % 12)+1);
			_SelectedDate.setFullYear(anios);
			_DateSelected.text=df.format(_SelectedDate);
		}
		
		private function _resizeTimeline():void
		{
			_MaxHeight = Fleaxy.$Current.$Stage.stageWidth - (_CategorieList.width + _CategorieList.x)+_CategorieList.$BtnMedidas.x	;
			$Bg.width = _MaxHeight;
			$Timeline.width = _MaxHeight * 0.9;
			$Timeline.y =(this.height - $Timeline.height) / 2;
			$Timeline.x = _MaxHeight * 0.05;
			_Selector.y =(-_DateSelected.height/2)+$Timeline.y + (_Selector.height - $Timeline.height) / 2;
			_Selector.x = $Timeline.x + (_selectorActualPercent * $Timeline.width);
			_DateInit.x = $Timeline.x - (_DateInit.width / 2);
			_DateInit.y = $Timeline.y + _DateInit.height + 20;
			_DateFinish.x =$Timeline.x+$Timeline.width-(_DateInit.width / 2);
			_DateFinish.y = _DateInit.y;
		}
		
		
	}

}