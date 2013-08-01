package nodehx.mongodb;
import nodehx.Error;

/**
 * Example of a simple url connection string for a single server connection
 * var Db = require('mongodb').Db,
 *     MongoClient = require('mongodb').MongoClient,
 *     Server = require('mongodb').Server,
 *     ReplSetServers = require('mongodb').ReplSetServers,
 *     ObjectID = require('mongodb').ObjectID,
 *     Binary = require('mongodb').Binary,
 *     GridStore = require('mongodb').GridStore,
 *     Grid = require('mongodb').Grid,
 *     Code = require('mongodb').Code,
 *     BSON = require('mongodb').pure().BSON,
 *     assert = require('assert');
 * // Connect using the connection string
 * MongoClient.connect("mongodb://localhost:27017/integration_tests", {native_parser:true}, function(err, db) {
 *   assert.equal(null, err);
 *   db.collection('mongoclient_test').update({a:1}, {b:1}, {upsert:true}, function(err, result) {
 *     assert.equal(null, err);
 *     assert.equal(1, result);
 *     db.close();
 *   });
 * });
 * Example of a simple url connection string to a replicaset, with acknowledgement of writes.
 * var Db = require('mongodb').Db,
 *     MongoClient = require('mongodb').MongoClient,
 *     Server = require('mongodb').Server,
 *     ReplSetServers = require('mongodb').ReplSetServers,
 *     ObjectID = require('mongodb').ObjectID,
 *     Binary = require('mongodb').Binary,
 *     GridStore = require('mongodb').GridStore,
 *     Grid = require('mongodb').Grid,
 *     Code = require('mongodb').Code,
 *     BSON = require('mongodb').pure().BSON,
 *     assert = require('assert');
 * MongoClient.connect("mongodb://localhost:30000,localhost:30001,localhost:30002/integration_test_?w=1", function(err, db) {
 *   assert.equal(null, err);
 *   assert.ok(db != null);
 *   db.collection("replicaset_mongo_client_collection").update({a:1}, {b:1}, {upsert:true}, function(err, result) {
 *     assert.equal(null, err);
 *     assert.equal(1, result);
 *     db.close();
 *   });
 * });
 * Example of a simple url connection string to a shard, with acknowledgement of writes.
 * var Db = require('mongodb').Db,
 *     MongoClient = require('mongodb').MongoClient,
 *     Server = require('mongodb').Server,
 *     ReplSetServers = require('mongodb').ReplSetServers,
 *     ObjectID = require('mongodb').ObjectID,
 *     Binary = require('mongodb').Binary,
 *     GridStore = require('mongodb').GridStore,
 *     Grid = require('mongodb').Grid,
 *     Code = require('mongodb').Code,
 *     BSON = require('mongodb').pure().BSON,
 *     assert = require('assert');
 * MongoClient.connect('mongodb://localhost:50000,localhost:50001/sharded_test_db?w=1', function(err, db) {
 *   assert.equal(null, err);
 *   assert.ok(db != null);
 *   db.collection("replicaset_mongo_client_collection").update({a:1}, {b:1}, {upsert:true}, function(err, result) {
 *     assert.equal(null, err);
 *     assert.equal(1, result);
 *     db.close();
 *   });
 * });
 */
extern class MongoClient {
	/**
	 * Create a new MongoClient instance.
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
	 * Deprecated Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	public function new(serverConfig : Dynamic, ?options : Dynamic) : Void;
	
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
	public function connect(url : String, options : Dynamic, callback : Error -> Db -> Void) : Void;

	/**
	 * Initialize the database connection.
	 */
	public function open(callback : Error -> MongoClient -> Void) : Void;
	
	/**
	 * Initialize the database connection.
	 */
	public function close(callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Create a new Db instance sharing the current socket connections.
	 */
	public function db(dbName : String) : Db;
	
	/**
	 * [Note: renamed to connectTo instead of connect to avoid duplicated function name]
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
	public static inline function connectTo(url : String, options : Dynamic, callback : Error -> Db -> Void) : Void {
		untyped MongoClient.connect(url, options, callback);
	}
}