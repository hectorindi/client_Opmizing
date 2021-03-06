﻿/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/


package ispring.as2player
{
	public interface IPresenterInfo
	{
		function get name():String;
		function get title():String;
		function get biographyText():String;
		function get email():String;
		function get webSite():String;
		function hasPhoto():Boolean;
		function get index():Number;
	}
}
