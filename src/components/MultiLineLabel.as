package components
{
	import flash.display.DisplayObject;
	import flash.text.TextFieldAutoSize;

	
	import spark.components.Label;
	
	public class MultiLineLabel extends spark.components.Label
	{
		
		override protected function createChildren() : void
		{
			// Create a UITextField to display the label.
			/*if (!textField)
			{
				textField = new UITextField();
				textField.styleName = this;
				addChild(DisplayObject(textField));
			}
			super.createChildren();
			textField.multiline = true;
			textField.wordWrap = true;
			textField.autoSize = TextFieldAutoSize.LEFT;*/
		}
	}
}