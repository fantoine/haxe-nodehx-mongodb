package nodehx.mongodb;
import nodehx.Buffer;
import nodehx.Error;

/**
 * A class representation of a file stored in GridFS.
 */
extern class GridStore<TDocument> {
	/**
	 * The collection to be used for holding the files and chunks collection.
	 */
	public static var DEFAULT_ROOT_COLLECTION(default, never) : String;
	
	/**
	 * Default file mime type
	 */
	public static var DEFAULT_CONTENT_TYPE(default, never) : String;
	
	/**
	 * Seek mode where the given length is absolute.
	 */
	public static var IO_SEEK_SET(default, never) : Int;
	
	/**
	 * Seek mode where the given length is an offset to the current read/write head.
	 */
	public static var IO_SEEK_CUR(default, never) : Int;
	
	/**
	 * Seek mode where the given length is an offset to the end of the file.
	 */
	public static var IO_SEEK_END(default, never) : Int;
	
	/**
	 * Returns the current chunksize of the file.
	 */
	public var chunkSize(default, null) : Int;

	/**
	 * The md5 checksum for this file.
	 */
	public var md5(default, null) : String;
	
	/**
	 * Modes
	 * 	“r” - read only. This is the default mode.
	 * 	“w” - write in truncate mode. Existing data will be overwriten.
	 * 	“w+” - write in edit mode.
	 * Options
	 * 	root {String}, root collection to use. Defaults to {GridStore.DEFAULT_ROOT_COLLECTION}.
	 * 	content_type {String}, mime type of the file. Defaults to {GridStore.DEFAULT_CONTENT_TYPE}.
	 * 	chunk_size {Number}, size for the chunk. Defaults to {Chunk.DEFAULT_CHUNK_SIZE}.
	 * 	metadata {Object}, arbitrary data the user wants to store.
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where < 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 */
	@:overload(function(db : Db, mode : String, ?options : Dynamic) : Void {})
	@:overload(function(db : Db, id : Dynamic, mode : String, ?options : Dynamic) : Void {})
	public function new(db : Db, id : Dynamic, filename : String, mode : String, ?options : Dynamic) : Void;
	
	/**
	 * Opens the file from the database and initialize this object. Also creates a new one if file does not exist.
	 */
	public function open(callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Stores a file from the file system to the GridFS database.
	 */
	public function writeFile(file : String, callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Saves this file to the database. This will overwrite the old entry if it already exists. 
	 * This will work properly only if mode was initialized to “w” or “w+”.
	 */
	public function close(callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Retrieve this file’s chunks collection.
	 */
	public function chunkCollection(callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Deletes all the chunks of this file in the database.
	 */
	public function unlink(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Retrieves the file collection associated with this object.
	 */
	public function collection(callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Reads the data of this file.
	 */
	@:overload(function(callback : Error -> Array<String> -> Void) : Void {})
	public function readlines(separator : String, callback : Error -> Array<String> -> Void) : Void;
	
	/**
	 * Deletes all the chunks of this file in the database if mode was set to “w” or “w+” and 
	 * resets the read/write head to the initial position.
	 */
	public function rewind(callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Retrieves the contents of this file and advances the read/write head. Works with Buffers only.
	 */
	@:overload(function(callback : Error -> String -> Void) : Void {})
	@:overload(function(length : Int, callback : Error -> String -> Void) : Void {})
	public function read(length : Int, buffer : Buffer, callback : Error -> String -> Void) : Void;
	
	/**
	 * Retrieves the position of the read/write head of this file.
	 */
	public function tell(callback : Error -> Int -> Void) : Void;
	
	/**
	 * Moves the read/write head to a new location.
	 * Seek Location Modes
	 * 	GridStore.IO_SEEK_SET, (default) set the position from the start of the file.
	 * 	GridStore.IO_SEEK_CUR, set the position from the current position in the file.
	 * 	GridStore.IO_SEEK_END, set the position from the end of the file.
	 */
	@:overload(function(callback : Error -> GridStore<TDocument> -> Void) : Void {})
	@:overload(function(position : Int, callback : Error -> GridStore<TDocument> -> Void) : Void {})
	public function seek(position : Int, seekLocation : Int, callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Verify if the file is at EOF.
	 */
	public function eof() : Bool;
	
	/**
	 * Retrieves a single character from this file.
	 */
	public function getc(callback : Error -> Null<Int> -> Void) : Void;
	
	/**
	 * Writes a string to the file with a newline character appended at the end if the given string does not have one.
	 */
	public function puts(string : String, callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * Returns read stream based on this GridStore file
	 */
	public function stream(autoclose : Bool) : ReadStream;
	
	/**
	 * Checks if a file exists in the database.
	 * Options
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, 
	 * 		ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	@:overload(function(db : Db, name : String, callback : Error -> Bool -> Void) : Void {})
	public static function exist(db : Db, name : String, rootCollection : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Gets the list of files stored in the GridFS.
	 */
	@:overload(function(db : Db, callback : Error -> Array<String> -> Void) : Void {})
	public static function list(db : Db, rootCollection : String, callback : Error -> Array<String> -> Void) : Void;
	
	/**
	 * Writes some data. This method will work properly only if initialized with mode “w” or “w+”.
	 */
	@:overload(function(data : String, callback : Error -> GridStore<TDocument> -> Void) : Void {})
	public function write(data : String, close : Bool, callback : Error -> GridStore<TDocument> -> Void) : Void;
	
	/**
	 * pause
	 */
	public function pause() : Void;
	
	/**
	 * resume
	 */
	public function resume() : Void;
	
	
	/**
	 * Reads the contents of a file.
	 */
	@:overload(function(db : Db, name : String, callback : Error -> Buffer -> Void) : Void {})
	@:overload(function(db : Db, name : String, length : Int, callback : Error -> Buffer -> Void) : Void {})
	@:overload(function(db : Db, name : String, length : Int, offset : Int, callback : Error -> Buffer -> Void) : Void {})
	public static inline function readOf(db : Db, name : String, length : Int, offset : Int, options : Dynamic, callback : Error -> Buffer -> Void) : Void {
		untyped GridStore.read(db, name, length, offset, options, callback);
	}
	
	/**
	 * Reads the data of this file.
	 */
	@:overload(function(db : Db, name : String, callback : Error -> Array<String> -> Void) : Void {})
	@:overload(function(db : Db, name : String, separator : String, callback : Error -> Array<String> -> Void) : Void {})
	public static inline function readlinesOf(db : Db, name : String, separator : String, options : Dynamic, callback : Error -> Array<String> -> Void) : Void {
		untyped GridStore.readlines(db, name, separator, options, callback);
	}
	
	/**
	 * Deletes the chunks and metadata information of a file from GridFS.
	 */
	public static inline function unlinkOf(db : Db, names : String, ?options : Dynamic) : Void {
		untyped GridStore.unlink(db, names, options);
	}
}