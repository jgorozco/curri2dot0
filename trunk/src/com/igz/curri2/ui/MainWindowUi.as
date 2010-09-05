package com.igz.curri2.ui 
{
	import com.greensock.TimelineLite;
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
		_tagCloud.AddTag("Android", 3);
		_tagCloud.AddTag("Iphone",5);
		_tagCloud.AddTag("Flash", 4);
		_tagCloud.AddTag("Flash lite", 2);
		_tagCloud.AddTag("Web apps Java", 3);
		_tagCloud.AddTag("Movilidad", 2);
		_tagCloud.AddTag("Web Flash",3);
		_tagCloud.AddTag("Unity 3d", 2);
		_tagCloud.AddTag("poyas",3);
		addChild(_tagCloud);
		_tagCloud.x = 50;
		_tagCloud.y = 50;
		
		_PersonalData = new PersonalDataUi();
		_PersonalData.x = 150;
		_PersonalData.y =-300;
		addChild(_PersonalData);

		
		var p:PersonalDataDto = new PersonalDataDto();
		p.Name = "jose garcia orozco";
		p.Address = "c arroofbslkdjf a iafjao";
		p.Mail = "jose@fssa.ws";
		p.Photo = "http://lh3.ggpht.com/_z5BKP2TY3eg/SxgvhRZZ7fI/AAAAAAAAA7M/zJtBElLd34w/orla.jpg";
		p.DriveLicense = "1";
		p.Phone = "34134214321";
		p.Nationality = "felkefj´leq";
		p.Poblation = "nflefnl´qfle";
		p.University = "dfsafeafafa";			
		_PersonalData.$LoadPersonalData(p);
		

		_Categories = new CategoriesUi();
		addChild(_Categories);
		trace(Fleaxy.$Current.$Stage.stageHeight+"++"+_Categories.height);
		_Categories.y = (Fleaxy.$Current.$Stage.stageHeight-_Categories.height+120) / 2;
		
		var t:TimeLineUi = new TimeLineUi();
		t.x = _Categories.x + _Categories.width;
		t.y = _Categories.y;
		addChild(t);
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