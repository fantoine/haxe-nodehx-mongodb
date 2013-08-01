package nodehx.mongodb;

import nodehx.events.EventEmitter;

/**
 * Returns a stream interface for the file.
 */
extern class ReadStream extends EventEmitter {
	/**
	 * ReadStream
	 */
	public function new(autoclose : Bool, cursor : GridStore<Dynamic>) : Void;
	
	/**
	 * Pauses this stream, then no farther events will be fired.
	 */
	public function pause() : Void;
	
	/**
	 * Destroys the stream, then no farther events will be fired.
	 */
	public function destroy() : Void;
	
	/**
	 * Resumes this stream.
	 */
	public function resume() : Void;
}