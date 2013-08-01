package nodehx.mongodb;
import nodehx.Error;

/**
 * Allows the user to access the admin functionality of MongoDB
 */
extern class Admin {
	/**
	 * Allows the user to access the admin functionality of MongoDB
	 */
	public function new(db : Db) : Void;
	
	/**
	 * Retrieve the server information for the current instance of the db client
	 */
	public function buildInfo(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Retrieve this db’s server status.
	 */
	public function serverStatus(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Retrieve the current profiling Level for MongoDB
	 */
	public function profilingLevel(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Ping the MongoDB server and retrieve results
	 */
	public function ping(callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Authenticate against MongoDB
	 */
	public function authenticate(username : String, password : String, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Logout current authenticated user
	 */
	@:overload(function(callback : Error -> Bool -> Void) : Void {})
	public function logout(options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Add a user to the MongoDB server, if the user exists it will overwrite the current password
	 * Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(username : String, password : String, callback : Error -> Bool -> Void) : Void {})
	public function addUser(username : String, password : String, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Remove a user from the MongoDB server
	 * Options
	 * 	safe {true | {w:n, wtimeout:n} | {fsync:true}, default:false}, executes with a getLastError command returning the results of the command on MongoDB.
	 */
	@:overload(function(username : String, callback : Error -> Bool -> Void) : Void {})
	public function removeUser(username : String, options : Dynamic, callback : Error -> Bool -> Void) : Void;
	
	/**
	 * Set the current profiling level of MongoDB
	 */
	public function setProfilingLevel(level : String, callback : Error -> String -> Void) : Void;
	
	/**
	 * Retrive the current profiling information for MongoDB
	 */
	public function profilingInfo(callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Execute a db command against the Admin database
	 */
	@:overload(function(command : Dynamic, callback : Error -> Dynamic -> Void) : Void {})
	public function command(command : Dynamic, options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * Validate an existing collection
	 */
	@:overload(function(collectionName : String, callback : Error -> Dynamic -> Void) : Void {})
	public function validateCollection(collectionName : String, options : Dynamic, callback : Error -> Dynamic -> Void) : Void;
	
	/**
	 * List the available databases
	 */
	public function listDatabases(callback : Error -> Array<Dynamic> -> Void) : Void;
	
	/**
	 * Get ReplicaSet status
	 */
	public function replSetGetStatus(callback : Error -> Bool -> Void) : Void;
	
	
}