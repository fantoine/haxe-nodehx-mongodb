package nodehx.mongodb;

import nodehx.events.EventEmitter;

/**
 * Returns a stream interface for the cursor.
 */
extern class CursorStream<TDocument> extends EventEmitter {
	/**
	 * CursorStream
	 */
	public function new(cursor : Cursor<TDocument>) : Void;
	
	/**
	 * Pauses the stream.
	 */
	public function pause() : Void;
	
	/**
	 * Destroys the stream, closing the underlying cursor. No more events will be emitted.
	 */
	public function destroy() : Void;
	
	/**
	 * Resumes the stream.
	 */
	public function resume() : Void;
}