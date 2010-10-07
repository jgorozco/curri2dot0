package com.igz.curri2.ui 
{
	import com.greensock.plugins.VolumePlugin;
	import com.greensock.TweenLite;
	import com.igz.curri2.frwk.CategoryDto;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import igz.fleaxy.util.ObjectUtil;
	import igz.fleaxy.util.SpriteUtil;
	/**
	 * ...
	 * @author ...
	 */
	public class CategoriesUi extends Sprite
	{
		private var _Categories:Array;
		private var _CategoriesData:Array;
		private var _principal:Boolean;
		private var _Parent:ComboCategoriesUI;
		
		private var _SubCategories:CategoriesUi;
		
		public var $IsHidden:Boolean;
		
		private var _Settings:Object={ "width" : 80
									, "height" : 300
									};
		public function CategoriesUi(p_settings:Object) 
		{
			_CategoriesData = new Array();
			_Categories = new Array();
			
			ObjectUtil.$Merge( p_settings, _Settings );
			_Parent = (p_settings["parent"] as ComboCategoriesUI);
			_principal = (p_settings["principal"]as Boolean);
			var color:Number = (p_settings["color"] as Number);
			trace("IS PRINCIPAL?"+_principal);
			$IsHidden = _principal;
			graphics.beginFill(color);
			graphics.drawRect(0, 0, _Settings["width"], _Settings["height"]);
			graphics.endFill();
		}
		
		public function $ClearAllCategories():void
		{
			SpriteUtil.$RemoveChildsOf(this);
			_Categories = new Array();
			_CategoriesData = new Array();			
		}
		
		public function $AddCategorie(p_categore:CategoryDto):void
		{
			_CategoriesData.push(p_categore);
			var linkUi:LinkUi = new LinkUi(new LabelUi(p_categore.$Name, "default5"), { "onClick":_OnClickSelectCategorie } );
			linkUi.name = p_categore.$Name;
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
			graphics.beginFill(0x0000ff);
			graphics.drawRect(0, 0, width, _Settings["height"]);
			graphics.endFill();
		}
		
		private function _GetCategorie(p_str:String):CategoryDto
		{
		var cat:CategoryDto = null;
			for (var i:int = 0; i < _CategoriesData.length; i++)
			{
				if (p_str == (_CategoriesData[i] as CategoryDto).$Name)
				{
					cat	= (_CategoriesData[i] as CategoryDto);
				}
			}
		return cat;	
		}
		
		private function _OnClickSelectCategorie(p_event:MouseEvent):void
		{
			trace("es elprincipal:->"+_principal);
			if (_principal)
			{
				if (!$IsHidden)
				{
					var link:LinkUi = ( p_event.currentTarget as LinkUi);
					var currentCat:CategoryDto = _GetCategorie(link.name);
					_Parent.$AddSubCategorie(currentCat.$Sons);
					_Parent.$HideCategorie();
				}else
				{
					_Parent.$ShowCategorie();
				}
				$IsHidden = !$IsHidden;				
			}
			else
			{

			}			
		}
		
	}

}