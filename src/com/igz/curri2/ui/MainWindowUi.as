package com.igz.curri2.ui 
{
	import com.greensock.TimelineLite;
	import com.igz.curri2.Frwk;
	import com.igz.curri2.frwk.CategoryDto;
	import com.igz.curri2.frwk.PersonalDataDto;
	import flash.display.Sprite;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.text.LabelUi;
	import mx.controls.Label;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MainWindowUi extends Sprite
	{
		
		private var _tagCloud:TagsCloudUi;
		private var _PersonalData:PersonalDataUi;
		private var _ComboCategoriesUI:ComboCategoriesUI;
		private var _SecondaryCategories:CategoriesUi;
		private var _ProyectUi:ProyectUi;
		
		public function MainWindowUi() 
		{
		_addTimeline();
		_addExtraPlugins();
		_addProyectView();
		_addPersonalData();
		}
		
		private function _addTimeline():void
		{
			_ComboCategoriesUI = new ComboCategoriesUI();
			_ComboCategoriesUI.$AddCategorie( Frwk.$Current.$Categories);
			_ComboCategoriesUI.y = (Fleaxy.$Current.$Stage.stageHeight-_ComboCategoriesUI.height+120) / 2;
			addChild(_ComboCategoriesUI);
			_ComboCategoriesUI.$ShowCategorie();
		}

		private function _addPersonalData():void
		{
			_PersonalData = new PersonalDataUi();
			_PersonalData.x = 150;
			_PersonalData.y =-300;
			addChild(_PersonalData);
			_PersonalData.$LoadPersonalData(Frwk.$Current.$PersonalData);
		}
		
		
		private function _addExtraPlugins():void
		{
			var MySettings:Object = { "width" : 200
						, "height" : 200
						, "OnClickFunction" : _clickedFunction
				        }
		
					
						
		_tagCloud = new TagsCloudUi(MySettings);
		for each (var itm:CategoryDto in Frwk.$Current.$Categories) 
		{
		_tagCloud.AddTag(itm.$Name, itm.$Count+3);
		if (itm.$Sons.length > 0)
		  for each (var itm2:CategoryDto in itm.$Sons)
			{
			  _tagCloud.AddTag(itm2.$Name, itm.$Count);
		   
			}
			
		}
		
		addChild(_tagCloud);
		_tagCloud.x = 690;
		_tagCloud.y = 20;
		}		
		private function _addProyectView():void
		{
			_ProyectUi = new ProyectUi();
			addChild(_ProyectUi);
			_ProyectUi.y = (Fleaxy.$Current.$Stage.stageHeight - _ProyectUi.$HeaderHeight);
		}
		
		
		public function $ReloadProyectList(p_arr:Array):void
		{
			
		_ProyectUi.$SetArrayProyects(p_arr);	
		}
		
		private function _clickedFunction():void
		{
			trace("clicked function");
			var selected:String = _tagCloud.$GetCurrentTag();
		//	_Categories.$AddCategorie(selected);
			//var lab:LabelUi = new LabelUi(selected);
			//lab.x = Math.random() * 700;
			//lab.y = Math.random() * 700;
			//addChild(lab);
		}
		
	}

}