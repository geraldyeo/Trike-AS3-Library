package com.tribal.trike.utils {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;


	public class Ticker implements IEventDispatcher {
		// singleton
		private static var _instance : Ticker = null;
		// members
		private var _dispatchr : EventDispatcher;
		private var _shape : Shape;

		public function Ticker(lock : Class) {
			if (lock != Singleton) {
				throw new Error("Error: Instantiation failed. Use Ticker.instance instead.");
			}
			if (_instance != null) {
				throw new Error("Error: Ticker already initialised.");
			}

			_dispatchr = new EventDispatcher(this);

			// frame based
			_shape = new Shape();
			_shape.addEventListener(Event.ENTER_FRAME, dispatchEvent);
		}


		/**
		 * The <code>instance</code> method is a factory method to retrieve the
		 * singleton instance
		 * 
		 * @return A <code>Ticker</code> instance.
		 */
		static public function get instance() : Ticker {
			if (_instance == null) {
				_instance = new Ticker(Singleton);
			}
			return _instance;
		}


		// ------------------------------------------------------------
		// IEVENTDISPATCHER
		// ------------------------------------------------------------
		/**
		 * @copy flash.events.EventDispatcher#addEventListener()
		 */
		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void {
			_dispatchr.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}


		/**
		 * @copy flash.events.EventDispatcher#removeEventListener()
		 */
		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void {
			_dispatchr.removeEventListener(type, listener, useCapture);
		}


		/**
		 * @copy flash.events.EventDispatcher#dispatchEvent()
		 */
		public function dispatchEvent(event : Event) : Boolean {
			return _dispatchr.dispatchEvent(event);
		}


		/**
		 * @copy flash.events.EventDispatcher#hasEventListener()
		 */
		public function hasEventListener(type : String) : Boolean {
			return _dispatchr.hasEventListener(type);
		}


		/**
		 * @copy flash.events.EventDispatcher#willTrigger()
		 */
		public function willTrigger(type : String) : Boolean {
			return _dispatchr.willTrigger(type);
		}
	}
}
class Singleton {
}