package nodehx.mongodb;

import nodehx.Error;

/**
 * Create a new Collection instance (INTERNAL TYPE)
 */
extern class Collection<TDocument> {
	/**
	 * Options
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 * 	slaveOk {Boolean, default:false}, Allow reads from secondaries.
	 * 	serializeFunctions {Boolean, default:false}, serialize functions on the document.
	 * 	raw {Boolean, default:false}, perform all operations using raw bson objects.
	 * 	pkFactory {Object}, object overriding the basic ObjectID primary key generation.
	 */
	public function new(db : Db, collectionName : String, ?pkFactory : Dynamic, ?options : Dynamic) : Void;
	
	/**
	 * Inserts a single document or a an array of documents into MongoDB.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	continueOnError/keepGoing {Boolean, default:false}, keep inserting documents even if one document has an error, mongodb 1.9.1 >.
	 * 	serializeFunctions {Boolean, default:false}, serialize functions on the document.
	 * 	forceServerObjectId {Boolean, default:false}, let server assign ObjectId instead of the driver
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(docs : TDocument, callback : Error -> Array<TDocument> -> Void) : Void {})
	@:overload(function(docs : TDocument, options : Dynamic, callback : Error -> Array<TDocument> -> Void) : Void {})
	@:overload(function(docs : Array<TDocument>, callback : Error -> Array<TDocument> -> Void) : Void {})
	public function insert(docs : Array<TDocument>, options : Dynamic, callback : Error -> Array<TDocument> -> Void) : Void;
	
	/**
	 * Removes documents specified by <code>selector</code> from the db.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	single {Boolean, default:false}, removes the first document found.
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function() : Void {})
	@:overload(function(callback : Error -> Collection<TDocument> -> Void) : Void {})
	@:overload(function(select : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function remove(select : Dynamic, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Renames the collection.
	 * Options
	 * 	dropTarget {Boolean, default:false}, drop the target name collection if it previously exists.
	 */
	@:overload(function(newName : String, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function rename(newName : String, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Save a document. Simple full document replacement function. Not recommended for efficiency, use atomic operators and update instead for more efficient operations.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function() : Void {})
	@:overload(function(doc : Collection<TDocument>) : Void {})
	@:overload(function(callback : Error -> Collection<TDocument> -> Void) : Void {})
	@:overload(function(doc : Collection<TDocument>, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function save(doc : Collection<TDocument>, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Updates documents.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	upsert {Boolean, default:false}, perform an upsert operation.
	 * 	multi {Boolean, default:false}, update all documents matching the selector.
	 * 	serializeFunctions {Boolean, default:false}, serialize functions on the document.
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(selector : Dynamic, document : Dynamic) : Void {})
	@:overload(function(selector : Dynamic, document : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function update(selector : Dynamic, document : Dynamic, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * The distinct command returns returns a list of distinct values for the given key across a collection.
	 * Options
	 * 	readPreference {String}, the preferred read preference (Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(key : String, callback : Error -> Array<TDocument> -> Void) : Void {})
	@:overload(function(key : String, query : Dynamic, callback : Error -> Array<TDocument> -> Void) : Void {})
	public function distinct(key : String, query : Dynamic, options : Dynamic, callback : Error -> Array<TDocument> -> Void) : Void;
	
	/**
	 * Count number of matching documents in the db to a query.
	 * Options
	 * 	skip {Number}, The number of documents to skip for the count.
	 * 	limit {Number}, The limit of documents to count.
	 * 	readPreference {String}, the preferred read preference (Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(callback : Error -> Int -> Void) : Void {})
	@:overload(function(query : Dynamic, callback : Error -> Int -> Void) : Void {})
	public function count(query : Dynamic, options : Dynamic, callback : Error -> Int -> Void) : Void;
	
	/**
	 * Drop the collection
	 */
	public function drop(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Find and update a document.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	remove {Boolean, default:false}, set to true to remove the object before returning.
	 * 	upsert {Boolean, default:false}, perform an upsert operation.
	 * 	new {Boolean, default:false}, set to true if you want to return the modified object rather than the original. Ignored for remove.
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(query : Dynamic, sort : Array<Dynamic>, doc : Dynamic, callback : Error -> TDocument -> Void) : Void {})
	public function findAndModify(query : Dynamic, sort : Array<Dynamic>, doc : Dynamic, options : Dynamic, callback : Error -> TDocument -> Void) : Void;

	/**
	 * Find and remove a document
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(query : Dynamic, sort : Array<Dynamic>, callback : Error -> TDocument -> Void) : Void {})
	public function findAndRemove(query : Dynamic, sort : Array<Dynamic>, options : Dynamic, callback : Error -> TDocument -> Void) : Void;
	
	/**
	 * Creates a cursor for a query that can be used to iterate over results from MongoDB
	 * Options
	 * 	limit {Number, default:0}, sets the limit of documents returned in the query.
	 * 	sort {Array | Object}, set to sort the documents coming back from the query. Array of indexes, [[‘a’, 1]] etc.
	 * 	fields {Object}, the fields to return in the query. Object of fields to include or exclude (not both), {‘a’:1}
	 * 	skip {Number, default:0}, set to skip N documents ahead in your query (useful for pagination).
	 * 	hint {Object}, tell the query to use specific indexes in the query. Object of indexes to use, {‘_id’:1}
	 * 	explain {Boolean, default:false}, explain the query instead of returning the data.
	 * 	snapshot {Boolean, default:false}, snapshot query.
	 * 	timeout {Boolean, default:false}, specify if the cursor can timeout.
	 * 	tailable {Boolean, default:false}, specify if the cursor is tailable.
	 * 	tailableRetryInterval {Number, default:100}, specify the miliseconds between getMores on tailable cursor.
	 * 	numberOfRetries {Number, default:5}, specify the number of times to retry the tailable cursor.
	 * 	awaitdata {Boolean, default:false} allow the cursor to wait for data, only applicable for tailable cursor.
	 * 	exhaust {Boolean, default:false} have the server send all the documents at once as getMore packets, not recommended.
	 * 	batchSize {Number, default:0}, set the batchSize for the getMoreCommand when iterating over the query results.
	 * 	returnKey {Boolean, default:false}, only return the index key.
	 * 	maxScan {Number}, Limit the number of items to scan.
	 * 	min {Number}, Set index bounds.
	 * 	max {Number}, Set index bounds.
	 * 	showDiskLoc {Boolean, default:false}, Show disk location of results.
	 * 	comment {String}, You can put a $comment field on a query to make looking in the profiler logs simpler.
	 * 	raw {Boolean, default:false}, Return all BSON documents as Raw Buffer documents.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 * 	numberOfRetries {Number, default:5}, if using awaidata specifies the number of times to retry on timeout.
	 * 	partial {Boolean, default:false}, specify if the cursor should return partial results when querying against a sharded system
	 */
	@:overload(function() : Cursor<TDocument> {})
	@:overload(function(selector : Dynamic, fields : Dynamic) : Cursor<TDocument> {})
	@:overload(function(selector : Dynamic, options : Dynamic) : Cursor<TDocument> {})
	@:overload(function(selector : Dynamic, fields : Dynamic, options : Dynamic) : Cursor<TDocument> {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int) : Cursor<TDocument> {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, timeout : Int) : Cursor<TDocument> {})
	@:overload(function(callBack : Error -> Cursor<TDocument> -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, callBack : Error -> Cursor<TDocument> -> Void) : Void {})
	@:overload(function(selector : Dynamic, options : Dynamic, callBack : Error -> Cursor<TDocument> -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, options : Dynamic, callBack : Error -> Cursor<TDocument> -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, callBack : Error -> Cursor<TDocument> -> Void) : Void {})
	public function find(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, timeout : Int, callBack : Error -> Cursor<TDocument> -> Void) : Void;

	/**
	 * Finds a single document based on the query
	 * Options
	 * 	limit {Number, default:0}, sets the limit of documents returned in the query.
	 * 	sort {Array | Object}, set to sort the documents coming back from the query. Array of indexes, [[‘a’, 1]] etc.
	 * 	fields {Object}, the fields to return in the query. Object of fields to include or exclude (not both), {‘a’:1}
	 * 	skip {Number, default:0}, set to skip N documents ahead in your query (useful for pagination).
	 * 	hint {Object}, tell the query to use specific indexes in the query. Object of indexes to use, {‘_id’:1}
	 * 	explain {Boolean, default:false}, explain the query instead of returning the data.
	 * 	snapshot {Boolean, default:false}, snapshot query.
	 * 	timeout {Boolean, default:false}, specify if the cursor can timeout.
	 * 	tailable {Boolean, default:false}, specify if the cursor is tailable.
	 * 	batchSize {Number, default:0}, set the batchSize for the getMoreCommand when iterating over the query results.
	 * 	returnKey {Boolean, default:false}, only return the index key.
	 * 	maxScan {Number}, Limit the number of items to scan.
	 * 	min {Number}, Set index bounds.
	 * 	max {Number}, Set index bounds.
	 * 	showDiskLoc {Boolean, default:false}, Show disk location of results.
	 * 	comment {String}, You can put a $comment field on a query to make looking in the profiler logs simpler.
	 * 	raw {Boolean, default:false}, Return all BSON documents as Raw Buffer documents.
	 * 	readPreference {String}, the preferred read preference (Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 * 	partial {Boolean, default:false}, specify if the cursor should return partial results when querying against a sharded system
	 */
	@:overload(function() : TDocument {})
	@:overload(function(selector : Dynamic) : TDocument {})
	@:overload(function(selector : Dynamic, fields : Dynamic) : TDocument {})
	@:overload(function(selector : Dynamic, options : Dynamic) : TDocument {})
	@:overload(function(selector : Dynamic, fields : Dynamic, options : Dynamic) : TDocument {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int) : TDocument {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, timeout : Int) : TDocument {})
	@:overload(function(callBack : Error -> TDocument -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, callBack : Error -> TDocument -> Void) : Void {})
	@:overload(function(selector : Dynamic, options : Dynamic, callBack : Error -> TDocument -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, options : Dynamic, callBack : Error -> TDocument -> Void) : Void {})
	@:overload(function(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, callBack : Error -> TDocument -> Void) : Void {})
	public function findOne(selector : Dynamic, fields : Dynamic, skip : Int, limit : Int, timeout : Int, callBack : Error -> TDocument -> Void) : Void;

	/**
	 * Creates an index on the collection.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	unique {Boolean, default:false}, creates an unique index.
	 * 	sparse {Boolean, default:false}, creates a sparse index.
	 * 	background {Boolean, default:false}, creates the index in the background, yielding whenever possible.
	 * 	dropDups {Boolean, default:false}, a unique index cannot be created on a key that has pre-existing duplicate values. If you would like to create the index anyway, keeping the first document the database indexes and deleting all subsequent documents that have duplicate value
	 * 	min {Number}, for geospatial indexes set the lower bound for the co-ordinates.
	 * 	max {Number}, for geospatial indexes set the high bound for the co-ordinates.
	 * 	v {Number}, specify the format version of the indexes.
	 * 	expireAfterSeconds {Number}, allows you to expire data on indexes applied to a data (MongoDB 2.2 or higher)
	 * 	name {String}, override the autogenerated index name (useful if the resulting name is larger than 128 bytes)
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(fieldOrSpec : Dynamic, callback : Error -> String -> Void) : Void {})
	public function createIndex(fieldOrSpec : Dynamic, options : Dynamic, callback : Error -> String -> Void) : Void;
	
	/**
	 * Ensures that an index exists, if it does not it creates it
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	unique {Boolean, default:false}, creates an unique index.
	 * 	sparse {Boolean, default:false}, creates a sparse index.
	 * 	background {Boolean, default:false}, creates the index in the background, yielding whenever possible.
	 * 	dropDups {Boolean, default:false}, a unique index cannot be created on a key that has pre-existing duplicate values. If you would like to create the index anyway, keeping the first document the database indexes and deleting all subsequent documents that have duplicate value
	 * 	min {Number}, for geospatial indexes set the lower bound for the co-ordinates.
	 * 	max {Number}, for geospatial indexes set the high bound for the co-ordinates.
	 * 	v {Number}, specify the format version of the indexes.
	 * 	expireAfterSeconds {Number}, allows you to expire data on indexes applied to a data (MongoDB 2.2 or higher)
	 * 	name {String}, override the autogenerated index name (useful if the resulting name is larger than 128 bytes)
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(fieldOrSpec : Dynamic, callback : Error -> String -> Void) : Void {})
	public function ensureIndex(fieldOrSpec : Dynamic, options : Dynamic, callback : Error -> String -> Void) : Void;
	
	/**
	 * Retrieves this collections index info.
	 * Options
	 * 	full {Boolean, default:false}, returns the full raw index information.
	 */
	@:overload(function(callback : Error -> Dynamic -> Void) : Void {})
	public function indexInformation(options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Drops an index from this collection.
	 */
	public function dropIndex(name : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Drops all indexes from this collection.
	 */
	public function dropAllIndexes(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Reindex all indexes on the collection Warning: reIndex is a blocking operation (indexes are rebuilt in the foreground) 
	 * and will be slow for large collections.
	 */
	public function reIndex(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Run Map Reduce across a collection. Be aware that the inline option for out will return an array of results not a collection.
	 * Options
	 * 	out {Object}, sets the output target for the map reduce job. {inline:1} | {replace:’collectionName’} | {merge:’collectionName’} | {reduce:’collectionName’}
	 * 	query {Object}, query filter object.
	 * 	sort {Object}, sorts the input objects using this key. Useful for optimization, like sorting by the emit key for fewer reduces.
	 * 	limit {Number}, number of objects to return from collection.
	 * 	keeptemp {Boolean, default:false}, keep temporary data.
	 * 	finalize {Function | String}, finalize function.
	 * 	scope {Object}, can pass in variables that can be access from map/reduce/finalize.
	 * 	jsMode {Boolean, default:false}, it is possible to make the execution stay in JS. Provided in MongoDB > 2.0.X.
	 * 	verbose {Boolean, default:false}, provide statistics on job execution time.
	 * 	readPreference {String, only for inline results}, the preferred read preference (Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	 @:overload(function(map : String, reduce : String, callback : Error -> Collection<TDocument> -> Void) : Void {})
	 @:overload(function(map : String, reduce : String, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void {})
	 @:overload(function(map : Void -> Void, reduce : Dynamic -> Array<Dynamic> -> Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function mapReduce(map : Void -> Void, reduce : Dynamic -> Array<Dynamic> -> Dynamic, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;

	/**
	 * Run a group command across a collection
	 * Options
	 * 	readPreference {String}, the preferred read preference (Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(keys : Dynamic, condition : Dynamic, initial : Dynamic, reduce : Dynamic -> Array<Dynamic> -> Dynamic, finalize : Dynamic -> Dynamic, command : Bool, callback : Error -> Array<Dynamic> -> Void) : Void {})
	public function group(keys : Dynamic, condition : Dynamic, initial : Dynamic, reduce : Dynamic -> Array<Dynamic> -> Dynamic, finalize : Dynamic -> Dynamic, command : Bool, options : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Returns the options of the collection.
	 */
	public function options(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Returns if the collection is a capped collection
	 */
	public function isCapped(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Checks if one or more indexes exist on the collection
	 */
	public function indexExists(indexNames : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Execute the geoNear command to search for items in the collection
	 * Options
	 * 	num {Number}, max number of results to return.
	 * 	maxDistance {Number}, include results up to maxDistance from the point.
	 * 	distanceMultiplier {Number}, include a value to multiply the distances with allowing for range conversions.
	 * 	query {Object}, filter the results by a query.
	 * 	spherical {Boolean, default:false}, perform query using a spherical model.
	 * 	uniqueDocs {Boolean, default:false}, the closest location in a document to the center of the search region will always be returned MongoDB > 2.X.
	 * 	includeLocs {Boolean, default:false}, include the location data fields in the top level of the results MongoDB > 2.X.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(x : Int, y : Int, callback : Error -> Dynamic -> Void) : Void {})
	public function geoNear(x : Int, y : Int, options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Execute a geo search using a geo haystack index on a collection.
	 * Options
	 * 	maxDistance {Number}, include results up to maxDistance from the point.
	 * 	search {Object}, filter the results by a query.
	 * 	limit {Number}, max number of results to return.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(x : Int, y : Int, callback : Error -> Dynamic -> Void) : Void {})
	public function geoHaystackSearch(x : Int, y : Int, options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Retrieve all the indexes on the collection.
	 */
	public function indexes(callback : Error -> Array<String> -> Void) : Void;
	
	/**
	 * Execute an aggregation framework pipeline against the collection, needs MongoDB >= 2.1
	 * Options
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(array : Array<Dynamic>, callback : Error -> Array<Dynamic> -> Void) : Void {})
	public function aggregate(array : Array<Dynamic>, options : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Get all the collection statistics.
	 * Options
	 * 	scale {Number}, divide the returned sizes by scale value.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(callback : Error -> Dynamic -> Void) : Void {})
	public function stats(options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
}