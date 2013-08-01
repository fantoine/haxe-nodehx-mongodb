package nodehx.mongodb;
import nodehx.Error;

extern class Db {
	/**
	 * Default URL
	 */
	public static var DEFAULT_URL(default, never) : String;
	
	/**
	 * Create a new Db instance.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where < 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 * 	native_parser {Boolean, default:false}, use c++ bson parser.
	 * 	forceServerObjectId {Boolean, default:false}, force server to create _id fields instead of client.
	 * 	pkFactory {Object}, object overriding the basic ObjectID primary key generation.
	 * 	serializeFunctions {Boolean, default:false}, serialize functions.
	 * 	raw {Boolean, default:false}, peform operations using raw bson buffers.
	 * 	recordQueryStats {Boolean, default:false}, record query statistics during execution.
	 * 	retryMiliSeconds {Number, default:5000}, number of miliseconds between retries.
	 * 	numberOfRetries {Number, default:5}, number of retries off connection.
	 * 	logger {Object, default:null}, an object representing a logger that you want to use, needs to support functions debug, log, error ({error:function(message, object) {}, log:function(message, object) {}, debug:function(message, object) {}}).
	 * 	slaveOk {Number, default:null}, force setting of SlaveOk flag on queries (only use when explicitly connecting to a secondary server).
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	public function new(databaseName : String, serverConfig : Server, ?options : Dynamic) : Void;
	
	/**
	 * Initialize the database connection.
	 */
	public function open(callback : Error -> Db -> Void) : Void;
	
	/**
	 * Create a new Db instance sharing the current socket connections.
	 */
	public function db(dbName : String) : Db;
	
	/**
	 * Close the current db connection, including all the child db instances. 
	 * Emits close event if no callback is provided.
	 */
	@:overload(function() : Void {})
	@:overload(function(forceClose : Bool) : Void {})
	@:overload(function(callback : Error -> Bool -> Void) : Void {})
	public function close(forceClose : Bool, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Access the Admin database
	 */
	@:overload(function() : Admin {})
	public function admin(callback : Admin -> Void) : Admin;
	
	/**
	 * Returns a cursor to all the collection information.
	 */
	@:overload(function(callback : Error -> Cursor<Dynamic> -> Void) : Void {})
	public function collectionsInfo(collectionName : String, callback : Error -> Cursor<Dynamic> -> Void) : Void;
	
	/**
	 * Get the list of all collection names for the specified db
	 */
	@:overload(function(callback : Error -> Array<String> -> Void) : Void {})
	@:overload(function(collectionName : String, callback : Error -> Array<String> -> Void) : Void {})
	public function collectionNames(collectionName : String, options : Dynamic, callback : Error -> Array<String> -> Void) : Void;
	
	/**
	 * Fetch a specific collection (containing the actual collection information). If the application does not use strict mode you can can use it without a callback in the following way. var collection = db.collection(‘mycollection’);
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	serializeFunctions {Boolean, default:false}, serialize functions on the document.
	 * 	raw {Boolean, default:false}, perform all operations using raw bson objects.
	 * 	pkFactory {Object}, object overriding the basic ObjectID primary key generation.
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 * 	strict, (Boolean, default:false) throws an error if the collection does not exist
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function<TDocument>(collectionName : String) : Collection<TDocument> {})
	@:overload(function<TDocument>(collectionName : String, options : Dynamic) : Collection<TDocument> {})
	@:overload(function<TDocument>(collectionName : String, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function collection<TDocument>(collectionName : String, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Fetch all collections for the current db.
	 */
	public function collections<TDocument>(callback : Error -> Array<Collection<TDocument>> -> Void) : Void;
	
	/**
	 * Evaluate javascript on the server
	 * Options
	 * 	nolock {Boolean, default:false}, Tell MongoDB not to block on the evaulation of the javascript.
	 */
	@:overload(function(code : Code, callback : Error -> Dynamic -> Void) : Void {})
	@:overload(function(code : Code, parameters : Dynamic, callback : Error -> Dynamic -> Void) : Void {})
	public function eval(code : Code, parameters : Dynamic, options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Dereference a dbref, against a db
	 */
	public function dereference(dbRef : DBRef, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Logout user from server, fire off on all connections and remove all auth info
	 */
	public function logout(callback : Error -> Bool) : Void;
	
	/**
	 * Authenticate a user against the server. authMechanism
	 * Options
	 * 	authSource {String}, The database that the credentials are for, different from the name of the current DB, for example admin
	 * 	authMechanism {String, default:MONGODB-CR}, The authentication mechanism to use, GSSAPI or MONGODB-CR
	 */
	@:overload(function(userName : String, password : String, callback : Error -> Bool -> Void) : Void {})
	public function authenticate(username : String, password : String, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Add a user to the database.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(userName : String, password : String, callback : Error -> Bool -> Void) : Void {})
	public function addUser(username : String, password : String, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Remove a user from a database
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(userName : String, callback : Error -> Bool -> Void) : Void {})
	public function removeUser(username : String, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Creates a collection on a server pre-allocating space, need to create f.ex capped collections.
	 * Options
	 * 	w, {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 * 	wtimeout, {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 * 	fsync, (Boolean, default:false) write waits for fsync before returning
	 * 	journal, (Boolean, default:false) write waits for journal sync before returning
	 * 	serializeFunctions {Boolean, default:false}, serialize functions on the document.
	 * 	raw {Boolean, default:false}, perform all operations using raw bson objects.
	 * 	pkFactory {Object}, object overriding the basic ObjectID primary key generation.
	 * 	capped {Boolean, default:false}, create a capped collection.
	 * 	size {Number}, the size of the capped collection in bytes.
	 * 	max {Number}, the maximum number of documents in the capped collection.
	 * 	autoIndexId {Boolean, default:true}, create an index on the _id field of the document, True by default on MongoDB 2.2 or higher off for version &lt; 2.2.
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 * 	strict, (Boolean, default:false) throws an error if collection already exists
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function<TDocument>(collectionName : String, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function createCollection<TDocument>(collectionName : String, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Execute a command hash against MongoDB. This lets you acess any commands not available through the api on the server.
	 */
	public function command(selector : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Drop a collection from the database, removing it permanently. New accesses will create a new collection.
	 */
	public function dropCollection(collectionName : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Rename a collection.
	 * Options
	 * 	dropTarget {Boolean, default:false}, drop the target name collection if it previously exists.
	 */
	@:overload(function<TDocument>(fromCollection : String, toCollection : String, callback : Error -> Collection<TDocument> -> Void) : Void {})
	public function renameCollection<TDocument>(fromCollection : String, toCollection : String, options : Dynamic, callback : Error -> Collection<TDocument> -> Void) : Void;
	
	/**
	 * Return last error message for the given connection, note options can be combined.
	 * Options
	 * 	fsync {Boolean, default:false}, option forces the database to fsync all files before returning.
	 * 	j {Boolean, default:false}, awaits the journal commit before returning, > MongoDB 2.0.
	 * 	w {Number}, until a write operation has been replicated to N servers.
	 * 	wtimeout {Number}, number of miliseconds to wait before timing out.
	 * Connection Options
	 * 	connection {Connection}, fire the getLastError down a specific connection.
	 */
	@:overload(function(callback : Error -> Array<Dynamic> -> Void) : Void {})
	@:overload(function(options : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void {})
	public function lastError(options : Dynamic, connectionOptions : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Return all errors up to the last time db reset_error_history was called.
	 * Options
	 * 	connection {Connection}, fire the getLastError down a specific connection.
	 */
	@:overload(function(ccallback : Error -> Array<Dynamic> -> Void) : Void {})
	public function previousErrors(options : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Resets the error history of the mongo instance.
	 * Options
	 * 	connection {Connection}, fire the getLastError down a specific connection.
	 */
	@:overload(function(callback : Error -> Bool -> Void) : Void {})
	public function resetErrorHistory(options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
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
	@:overload(function(collectionName : String, fieldOrSpec : Dynamic, callback : Error -> Bool -> Void) : Void {})
	public function createIndex(collectionName : String, fieldOrSpec : Dynamic, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
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
	@:overload(function(collectionName : String, fieldOrSpec : Dynamic, callback : Error -> String -> Void) : Void {})
	public function ensureIndex(collectionName : String, fieldOrSpec : Dynamic, options : Dynamic, callback : Error -> String -> Void) : Void;

	/**
	 * Returns the information available on allocated cursors.
	 * Options
	 * 	readPreference {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, 
	 * 		ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	@:overload(function(callback : Error -> Dynamic -> Void) : Void {})
	public function cursorInfo(options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Drop an index on a collection.
	 */
	public function dropIndex(collectionName : String, indexName : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Reindex all indexes on the collection Warning: reIndex is a blocking operation (indexes are rebuilt in the foreground) and will be slow for large collections.
	 */
	public function reIndex(collectionName : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Retrieves this collections index info.
	 * Options
	 * 	full {Boolean, default:false}, returns the full raw index information.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(collectionName : String, callback : Error -> Array<Dynamic> -> Void) : Void {})
	public function indexInformation(collectionName : String, options : Dynamic, callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Drop a database.
	 */
	public function dropDatabase(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Get all the db statistics.
	 * Options
	 * 	scale {Number}, divide the returned sizes by scale value.
	 * 	readPreference {String}, the preferred read preference ((Server.PRIMARY, Server.PRIMARY_PREFERRED, Server.SECONDARY, Server.SECONDARY_PREFERRED, Server.NEAREST).
	 */
	@:overload(function(callback : Error -> Dynamic -> Void) : Void {})
	public function stats(options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Connect to MongoDB using a url as documented at
	 * docs.mongodb.org/manual/reference/connection-string/
	 * Options
	 * 	uri_decode_auth {Boolean, default:false} uri decode the user name and password for authentication
	 * 	db {Object, default: null} a hash off options to set on the db object, see Db constructor
	 * 	server {Object, default: null} a hash off options to set on the server objects, see Server constructor**
	 * 	replSet {Object, default: null} a hash off options to set on the replSet object, see ReplSet constructor**
	 * 	mongos {Object, default: null} a hash off options to set on the mongos object, see Mongos constructor**
	 */
	@:overload(function(url : String, callback : Error -> Db -> Void) : Void {})
	public static function connect(url : String, options : Dynamic, callback : Error -> Db -> Void) : Void;
}