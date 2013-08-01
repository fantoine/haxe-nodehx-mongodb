package nodehx.mongodb;
import nodehx.Buffer;
import nodehx.Error;

/**
 * A class representation of a simple Grid interface.
 */
extern class Grid {
	/**
	 * A class representation of a simple Grid interface.
	 */
	public function new(db : Db, ?fsName : String) : Void;
	
	/**
	 * Puts binary data to the grid
	 * Options
	 * 	_id {Any}, unique id for this file
	 * 	root {String}, root collection to use. Defaults to {GridStore.DEFAULT_ROOT_COLLECTION}.
	 * 	content_type {String}, mime type of the file. Defaults to {GridStore.DEFAULT_CONTENT_TYPE}.
	 * 	chunk_size {Number}, size for the chunk. Defaults to {Chunk.DEFAULT_CHUNK_SIZE}.
	 * 	metadata {Object}, arbitrary data the user wants to store.
	 */
	@:overload(function(data : Buffer, callback : Error -> Grid -> Void) : Void {})
	public function put(data : Buffer, options : Dynamic, callback : Error -> Grid -> Void) : Void;
	
	/**
	 * Get binary data to the grid
	 */
	public function get(id : Dynamic, callback : Error -> Grid -> Void) : Void;
	
	/**
	 * Delete file from grid
	 */
	public function delete(id : Dynamic, callback : Error -> Grid -> Void) : Void;
}