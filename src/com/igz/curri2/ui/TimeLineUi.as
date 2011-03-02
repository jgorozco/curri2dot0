package com.igz.curri2.ui 
{
	import com.igz.curri2.Frwk;
	import com.igz.curri2.frwk.CategoryDto;
	import com.igz.curri2.frwk.ProyectDto;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import igz.fleaxy.util.SpriteUtil;
	import mx.formatters.DateFormatter;
	/**
	 * ...
	 * @author ...
	 */
	public class TimeLineUi extends Sprite
	{
		
		private var MAXHEIGHT:Number = 500;
		private var OFFSET:Number =25;
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
		private var _ListCategories:Array;	
		private var _LIneContainter:Sprite;
		
		public function TimeLineUi(p_categorie:CategoriesUi=null) 
		{
			df= new DateFormatter();
			df.formatString = "MM-YYYY";
			$Bg = new Sprite();
			_EndDate = new Date();
			$Bg.graphics.beginFill(0xffff055);
			$Bg.graphics.drawRect(0, 0, MAXHEIGHT, p_categorie.height);
			$Bg.graphics.endFill();
			addChild($Bg);
			_LIneContainter = new Sprite();
			_LIneContainter.graphics.beginFill(0x00ff00,0.5);
			_LIneContainter.graphics.drawRect(0, 0, $Bg.width, $Bg.height);
			_LIneContainter.graphics.endFill();
			addChild(_LIneContainter);
			_MaxHeight = MAXHEIGHT;
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
			_ListCategories = new Array();
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
		
		private function _InitArrayDates():Array
		{
			var arr:Array = new Array();
			var mesesTot:int = 0;
			//1000*60*60*24*30
			//mesesTot = (_EndDate.getTime() - _InitialDate.getTime()) / 2592000000;
			mesesTot = (_EndDate.getFullYear() * 12 + _EndDate.getMonth()) - (_InitialDate.getFullYear() * 12 + _InitialDate.getMonth());
			trace("numero de meses:" + mesesTot);
			for (var i:int = 0; i < mesesTot; i++)
				{
				arr.push(0);
				}
			return arr;
			}
		
		private function _CreateMapFromCategorie(p_categorie:String, p_proyects:Array ):void
		{
			var p:ProyectDto;
			var i:int = 0;
			var arrTimes:Array = _MapLines[p_categorie];
			if  (arrTimes == null)
			{
			arrTimes = _InitArrayDates();	
			}
			for (i = 0; i < p_proyects.length; i++)
			{
				p = ( p_proyects[i] as  ProyectDto);
				if ((p.Category == p_categorie) || (p.SubCategory == p_categorie))
				{
					//numero de meses desde el inicio de la barra de tiempo desde que empezo
					var initM:Number = (p.InitDate.getFullYear() * 12 + p.InitDate.getMonth()) - (_InitialDate.getFullYear() * 12 + _InitialDate.getMonth());
					//numero de meses desde el inicio de la barra de tiempo desde que termino
	
					var finishM:Number= (p.EndDate.getFullYear() * 12 + p.EndDate.getMonth()) - (_InitialDate.getFullYear() * 12 + _InitialDate.getMonth());
					for (var j:Number = initM; j < finishM; j++)
						{
								arrTimes[j] = arrTimes[j] + 1;
						}
					}
			}
			
				_MapLines[p_categorie] = arrTimes;
				_ListCategories.push(p_categorie);
				_DrawTimeLineLines();
		}
		
		private function _DrawTimeLineLines():void
		{
			SpriteUtil.$RemoveChildsOf(_LIneContainter);
			for (var i:Number = 0; i < _ListCategories.length; i++)
			{
			var d:DisplayObject=_CategorieList.getChildByName(_ListCategories[i]);
			trace("posic [" + _ListCategories[i] + "] x[" + d.x + "]  y[" + d.y + "]");
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0x00ff00);
			s.graphics.lineStyle(1, 0XD1D1D1, 1, true);
			s.graphics.moveTo(0, d.y+OFFSET);
			s.graphics.lineTo($Timeline.x, $Timeline.y+OFFSET-5);
			s.graphics.endFill();
			s.name = "lines";
			_LIneContainter.addChild(s);
			}
					
			
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
			//_LIneContainter.width = _MaxHeight;
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