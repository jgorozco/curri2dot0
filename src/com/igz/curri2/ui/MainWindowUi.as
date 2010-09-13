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
		private var _Categories:CategoriesUi;
		private var _SecondaryCategories:CategoriesUi;
		
		public function MainWindowUi() 
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
		_tagCloud.x = 50;
		_tagCloud.y = 50;
		
		_PersonalData = new PersonalDataUi();
		_PersonalData.x = 150;
		_PersonalData.y =-300;
		addChild(_PersonalData);
		_PersonalData.$LoadPersonalData(Frwk.$Current.$PersonalData);
		

		_Categories = new CategoriesUi();
		addChild(_Categories);
		_InitCategories();
		trace(Fleaxy.$Current.$Stage.stageHeight+"++"+_Categories.height);
		_Categories.y = (Fleaxy.$Current.$Stage.stageHeight-_Categories.height+120) / 2;
		
		var t:TimeLineUi = new TimeLineUi();
		t.x = _Categories.x + _Categories.width;
		t.y = _Categories.y;
		addChild(t);
		}
		
		private function _InitCategories():void
		{
			var arr:Array = Frwk.$Current.$Categories;
			for each (var itm:CategoryDto in Frwk.$Current.$Categories)
			{
				_Categories.$AddCategorie(itm.$Name);
				
			}
		}
		
		private function _clickedFunction():void
		{
			trace("clicked function");
			var selected:String = _tagCloud.$GetCurrentTag();
			_Categories.$AddCategorie(selected);
			//var lab:LabelUi = new LabelUi(selected);
			//lab.x = Math.random() * 700;
			//lab.y = Math.random() * 700;
			//addChild(lab);
		}
		
	}

}