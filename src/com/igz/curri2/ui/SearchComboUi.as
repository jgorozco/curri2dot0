package com.igz.curri2.ui 
{
	import com.igz.curri2.Frwk;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import igz.fleaxy.Fleaxy;
	import igz.fleaxy.ui.ButtonUi;
	import igz.fleaxy.ui.form.input.Input;
	import igz.fleaxy.ui.form.input.InputType;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import mx.utils.StringUtil;
	/**
	 * ...
	 * @author ...
	 */
	public class SearchComboUi extends Sprite
	{
		private var _TitleLabel:LabelUi;
		private var _Input:Input;
		
		
		public function SearchComboUi()
		{

			var s:Sprite = new Sprite();
			s.graphics.beginFill(0xEEEEEE, 1);
			s.graphics.drawRoundRect(0, 0, 400, 350, 20, 20);
			s.graphics.endFill();
			s.x = (Fleaxy.$Current.$Stage.stageWidth-s.width)/2;
			s.y = (Fleaxy.$Current.$Stage.stageHeight-s.height)/2;
			
			var title:String = "Type the email from the CV you want to search";
			if (Frwk.$Current.$firstSearch>0)
			{
				title = "The input mail is wrong. Try to type it again";
			}
			_TitleLabel = new LabelUi(title,"default4", { "fixWidth" : 350
														, "maxLines" : 2
														});
			

			_Input = new Input("search_combo", { "width":350,
												"inputType" : InputType.$MAIL} );
			_Input.height = 50;
			var button:ButtonUi = new ButtonUi("Search", f_searchPerson, {  
								  "marginTop"      : 20
								  ,"marginInternal"	: 30
								  ,"round"          : 10
								  ,"labelStyle"     : "default1"
								  ,"background"     : 0xcacaca
								  ,"borderAlpha"	: 0
								  ,"width"          :100
								});
			_TitleLabel.x =25;
			_TitleLabel.y = 15;
			s.addChild(_TitleLabel);
			_Input.x = 25;
			_Input.y = 135;
			s.addChild(_Input);
			button.x = 275;
			button.y = 235;
			s.addChild(button);

			addChild(s);
		}
		
		public function f_searchPerson():void
		{
			if(_Input.$Validate())
			{	
				Frwk.$Current.$firstSearch = Frwk.$Current.$firstSearch+1;
				Frwk.$Current.$CVToLoad = _Input.$Value;
				Gui.$Current.MainWindow.$ShowLoading();
				Frwk.$Current.loadCV();
			}else
			{
			_Input.$Value = "put here the email!";
			}
			
		}
		
	}

}