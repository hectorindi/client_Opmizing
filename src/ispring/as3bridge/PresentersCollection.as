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
	public class PresentersCollection
	{		
		private var m_presenters:Array;
		private var m_presentersCount:int;
		
		public function PresentersCollection(internalClass:InternalClass, presentersCollection:Object)
		{			
			m_presentersCount = presentersCollection.presentersCount;
			m_presenters = new Array(m_presentersCount ? m_presentersCount : 0);
			
			initPresenters(presentersCollection.presenters);
		}
		
		private function initPresenters(presentersInfo:Object):void
		{
			for (var i:Number = 0; i < m_presentersCount; ++i)
			{
				var presenter:PresenterInfo = new PresenterInfo(new InternalClass(), presentersInfo["presenter" + i], i);
			
				m_presenters[i] = presenter;
			}
		}
		
		public function get presentersCount():int
		{
			return m_presentersCount;
		}
		
		public function getPresenter(index:int = 0):PresenterInfo
		{
			if (index < 0 || index >= m_presentersCount)
				return null;
				
			return m_presenters[index];
		}
	}
}