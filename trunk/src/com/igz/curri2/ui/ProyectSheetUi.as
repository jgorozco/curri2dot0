package com.igz.curri2.ui 
{
	import com.igz.curri2.frwk.ProyectDto;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import igz.fleaxy.ui.text.TextUi;
	import flash.net.navigateToURL;
	/**
	 * ...
	 * @author 
	 */
	public class ProyectSheetUi extends Sprite
	{
		private var _Title:LabelUi;
		private var _Company:LabelUi;
		private var _Category:LabelUi;
		private var _SubCategory:LabelUi;
		private var _DetailsLabel:LabelUi;
		private var _DetailsText:TextUi;
		private var _WebLink:LinkUi;
		private var _Bg:Sprite;
		public static var $SheetWidth:Number=300;
		public static var _SheetHeight:Number;	
		private var mydto:ProyectDto;
		
		public function ProyectSheetUi(p_proyectDTO:ProyectDto) 
		{
			mydto = p_proyectDTO;
			_Bg = new Sprite();
			_Bg.graphics.lineStyle(3, 0xCACACA);
			_Bg.graphics.beginFill(0xACACAC);
			_SheetHeight = 300;
			_Bg.graphics.drawRoundRect(0, 0, $SheetWidth, _SheetHeight,50);
			addChild(_Bg);
			_Title = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_Company = new LabelUi(p_proyectDTO.Company, "CenterH2");
			_Category = new LabelUi(p_proyectDTO.Category, "CenterH3");
			_SubCategory = new LabelUi(p_proyectDTO.SubCategory, "CenterH3");
			_DetailsLabel = new LabelUi("Detalles", "CenterH3");
			_DetailsText = new TextUi(p_proyectDTO.Description, "Content");
			
			_WebLink = new LinkUi(new LabelUi(p_proyectDTO.Url, "CenterH3"), { "onClick":$GoToUrl } );
			_DetailsText.width = 200;
			_DetailsText.height = 200;
			addChild(_Title);
			addChild(_Company);
			addChild(_Category);
			addChild(_SubCategory);
			addChild(_DetailsLabel);
			addChild(_DetailsText);
			addChild(_WebLink);
			$Recolocate();
		}
		
		public function $GoToUrl():void
		{
			var url:URLRequest = new URLRequest(mydto.Url);
			navigateToURL(url);
			
		}
		
		public function $Recolocate():void
		{
		_Title.x = 20;	
		_Title.y = 30;
		_Company.x = 30;
		_Company.y = 55;
		_Category.x = 35;
		_Category.y = 75;
		_SubCategory.x = 155;
		_SubCategory.y = 75;		
		_DetailsLabel.x = 35;
		_DetailsLabel.y = 100;
		_DetailsText.x = 35;
		_DetailsText.y = 125;
		_WebLink.x = _DetailsText.x;
		_WebLink.y = _DetailsText.y + _DetailsText.height+5;
		
		}
		
	}

}