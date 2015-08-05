﻿/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/

package ispring.as3bridge
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.display.DisplayObjectContainer;
	
	import flash.display.Stage;
	
	public class BridgeLoader extends EventDispatcher
	{
		public static const BRIDGE_LOADED:String = "bridgeLoaded";
		
		private var m_target:DisplayObjectContainer;
		private var m_player:Player;
		private var m_log:LogConsole;
		
		public function BridgeLoader(target:DisplayObjectContainer)
		{
			m_log = LogConsole.getInstance();
			m_target = target;
			
			m_player = new Player(new InternalClass(), m_target);
			m_player.addEventListener(BridgeEvent.BRIDGE_LOADED, onBridgeLoaded);
			m_player.addEventListener(BridgeEvent.PRESENTATION_LOADED, onPresentationLoaded);
		}
		
		public function connectToBridge(bridgeURL:String, commandConnectionName:String = "", eventConnectionName:String = ""):void
		{
			m_player.connectToBridge(bridgeURL, commandConnectionName, eventConnectionName);
		}
		
		public function loadPresentation(presentationURL:String):Player
		{			
			m_player.loadMovie(new InternalClass(), presentationURL);
			return m_player;
		}
		
		private function onPresentationLoaded(e:BridgeEvent):void
		{
			var sendEvent:BridgeEvent = new BridgeEvent(e.type);
			sendEvent.player = e.player;
			sendEvent.succeeded = e.succeeded
			dispatchEvent(sendEvent);
		}
		
		private function onBridgeLoaded(e:BridgeEvent):void
		{
			dispatchEvent(new BridgeEvent(BridgeEvent.BRIDGE_LOADED));
		}
	}
}