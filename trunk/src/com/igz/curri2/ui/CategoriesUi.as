package com.igz.curri2.ui 
{
	import com.greensock.plugins.VolumePlugin;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	/**
	 * ...
	 * @author ...
	 */
	public class CategoriesUi extends Sprite
	{
		private var _Categories:Array;
		
		public var $IsHidden:Boolean;
		
		private var _Settings:Object={ "width" : 80
									, "height" : 300
									};
		public function CategoriesUi() 
		{
			_Categories = new Array();
			$IsHidden = false;
			graphics.beginFill(0x0000ff);
			graphics.drawRect(0, 0, _Settings["width"], _Settings["height"]);
			graphics.endFill();
		}
		
		public function $AddCategorie(p_categore:String):void
		{
			var linkUi:LinkUi = new LinkUi(new LabelUi(p_categore, "default5"), { "onClick":_OnClickSelectCategorie } );
			_Categories.push(linkUi);
			addChild(linkUi);
			_ColocarEtiquetas();
		}
		
		private function _ColocarEtiquetas():void
		{
			var etiqs:Number = _Categories.length;
			var positioned:Number = 0;
			var maxHeight:Number = (_Categories[0] as LinkUi).height * etiqs;
			(_Categories[0] as LinkUi).x = this.width - (_Categories[0] as LinkUi).width;
			if (etiqs == 1)
			{
				positioned = _Settings["height"];
				(_Categories[0] as LinkUi).y = (_Settings["height"] - (_Categories[0] as LinkUi).height) / 2;
			}else
			{
				(_Categories[0] as LinkUi).y = 0;
				if (maxHeight > _Settings["height"])
				{
					_Settings["height"] = maxHeight;
				}
				positioned = _Settings["height"] / etiqs;
				for (var i:Number = 1; i < etiqs; i++)
				{
					(_Categories[i] as LinkUi).y = ( positioned * i) - ((_Categories[i] as LinkUi).height) / 2;
					(_Categories[i] as LinkUi).x = this.width - (_Categories[i] as LinkUi).width;
				}
			}
		}
		
		private function _OnClickSelectCategorie(p_event:MouseEvent):void
		{
			if (!$IsHidden)
			{
				var link:LinkUi = ( p_event.currentTarget as LinkUi);
				_HideCategories();
			}else
			{
				
			_ShowCategories();	
				
			}
			$IsHidden = !$IsHidden;
			
			
			
		}
		
		private function _ShowCategories():void
		{
			TweenLite.to(this, 0.5, { x: 0 });
		}
		
		private function _HideCategories():void
		{
			TweenLite.to(this, 0.5, { x: -0.8*this.width })			
		}
		
	}

}