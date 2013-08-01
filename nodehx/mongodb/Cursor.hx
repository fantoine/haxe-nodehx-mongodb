package nodehx.mongodb;

import nodehx.Error;

/**
 * Constructor for a cursor object that handles all the operations on query result using find. 
 * This cursor object is unidirectional and cannot traverse backwards. 
 * Clients should not be creating a cursor directly, but use find to acquire a cursor.
 */
extern class Cursor<TDocument> {
	/**
	 * Init state
	 */
	public static var INIT(default, never) : Int;
	
	/**
	 * Cursor open
	 */
	public static var OPEN(default, never) : Int;
	
	/**
	 * Cursor closed
	 */
	public static var CLOSED(default, never) : Int;
	
	/**
	 * Cursor performing a get more
	 */
	public static var GET_MORE(default, never) : Int;
	
	/**
	 * Options
	 * 	skip {Number} skip number of documents to skip.
	 * 	limit {Number}, limit the number of results to return. -1 has a special meaning and is used by Db.eval. A value of 1 will also be treated as if it were -1.
	 * 	sort {Array | Object}, set to sort the documents coming back from the query. Array of indexes, [[‘a’, 1]] etc.
	 * 	hint {Object}, hint force the query to use a specific index.
	 * 	explain {Boolean}, explain return the explaination of the query.
	 * 	snapshot {Boolean}, snapshot Snapshot mode assures no duplicates are returned.
	 * 	timeout {Boolean}, timeout allow the query to timeout.
	 * 	tailable {Boolean}, tailable allow the cursor to be tailable.
	 * 	awaitdata {Boolean}, awaitdata allow the cursor to wait for data, only applicable for tailable cursor.
	 * 	batchSize {Number}, batchSize the number of the subset of results to request the database to return for every request. This should initially be greater than 1 otherwise the database will automatically close the cursor. The batch size can be set to 1 with cursorInstance.batchSize after performing the initial query to the database.
	 * 	raw {Boolean}, raw return all query documents as raw buffers (default false).
	 * 	read {Boolean}, read specify override of read from source (primary/secondary).
	 * 	returnKey {Boolean}, returnKey only return the index key.
	 * 	maxScan {Number}, maxScan limit the number of items to scan.
	 * 	min {Number}, min set index bounds.
	 * 	max {Number}, max set index bounds.
	 * 	showDiskLoc {Boolean}, showDiskLoc show disk location of results.
	 * 	comment {String}, comment you can put a $comment field on a query to make looking in the profiler logs simpler.
	 * 	numberOfRetries {Number}, numberOfRetries if using awaidata specifies the number of times to retry on timeout.
	 * 	dbName {String}, dbName override the default dbName.
	 * 	tailableRetryInterval {Number}, tailableRetryInterval specify the miliseconds between getMores on tailable cursor.
	 * 	exhaust {Boolean}, exhaust have the server send all the documents at once as getMore packets.
	 * 	partial {Boolean}, partial have the sharded system return a partial result from mongos.
	 */
	public function new(db : Db, collection : Collection<TDocument>, selector : Dynamic, fields : Dynamic, ?options : Dynamic) : Void;
	
	/**
	 * Resets this cursor to its initial state. All settings like the query string, tailable, 
	 * batchSizeValue, skipValue and limits are preserved.
	 */
	public function rewind() : Cursor<TDocument>;
	
	/**
	 * Returns an array of documents. The caller is responsible for making sure that there is enough memory 
	 * to store the results. Note that the array only contain partial results when this cursor had been 
	 * previouly accessed. In that case, cursor.rewind() can be used to reset the cursor.
	 */
	public function toArray(callback : Error -> Array<TDocument> -> Void) : Void;
	
	/**
	 * Iterates over all the documents for this cursor. As with {cursor.toArray}, 
	 * not all of the elements will be iterated if this cursor had been previouly accessed. 
	 * In that case, {cursor.rewind} can be used to reset the cursor. 
	 * However, unlike {cursor.toArray}, the cursor will only hold a maximum of batch size elements 
	 * at any given time if batch size is specified. Otherwise, the caller is responsible 
	 * for making sure that the entire result can fit the memory.
	 */
	public function each(callback : Error -> TDocument -> Void) : Void;
	
	/**
	 * Determines how many result the query for this cursor will return
	 */
	public function count(applySkipLimit : Bool, callback : Error -> Int -> Void) : Void;
	
	/**
	 * Sets the sort parameter of this cursor to the given value.
	 */
	@:overload(function(keyOrList : Array<String>, callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument> {})
	@:overload(function(keyOrList : String, callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument> {})
	@:overload(function(keyOrList : Array<String>, direction : String, callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument> {})
	public function sort(keyOrList : String, direction : String, callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument>;
	
	/**
	 * Sets the limit parameter of this cursor to the given value.
	 */
	public function limit(limit : Int, ?callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument>;
	
	/**
	 * Sets the read preference for the cursor
	 */
	public function setReadPreference(the : String, ?callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument>;
	
	/**
	 * Sets the skip parameter of this cursor to the given value.
	 */
	public function skip(skip : Int, ?callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument>;
	
	/**
	 * Sets the batch size parameter of this cursor to the given value.
	 */
	public function batchSize(batchSize : Int, ?callback : Error -> Cursor<TDocument> -> Void) : Cursor<TDocument>;
	
	/**
	 * Gets the next document from the cursor.
	 */
	public function nextObject(callback : Error -> TDocument -> Void) : Void;
	
	/**
	 * Gets a detailed information about how the query is performed on this cursor and how long it took the database to process it.
	 */
	public function explain(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Returns a Node ReadStream interface for this cursor.
	 * Options
	 * 	transform {Function} function of type function(object) { return transformed }, allows for transformation of data before emitting.
	 */
	public function stream() : CursorStream<TDocument>;
	
	/**
	 * Close the cursor.
	 */
	public function close(callback : Error -> Cursor<TDocument> -> Void) : Void;
	
	/**
	 * Check if the cursor is closed or open.
	 */
	public function isClosed() : Bool;
}