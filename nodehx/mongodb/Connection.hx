package nodehx.mongodb;

import nodehx.Error;
import nodehx.events.EventEmitter;

extern class Connection extends EventEmitter {
	/**
	 * Store all socket options
	 */
	public var socketOptions : Dynamic;
	
	/**
	 * Id for the connection
	 */
	public var id(default, null) : String;
	
	/**
	 * State of the connection
	 */
	public var connected(default, null) : Bool;
	
	/**
	 * Set if this is a domain socket
	 */
	public var domainSocket : Bool;

	/**
	 * Connection parsing state
	 */
	public var maxBsonSize : Int;
	public var maxMessageSizeBytes : Int;
	
	/**
	 * Set max bson size
	 */
	public static var DEFAULT_MAX_BSON_SIZE(default, never) : Int;
	
	/**
	 * Set default to max bson to avoid overflow or bad guesses
	 */
	public static var DEFAULT_MAX_MESSAGE_SIZE(default, never) : Int;
	
	/**
	 * Some basic defaults
	 */
	public static var DEFAULT_PORT(default, never) : Int;

	public function new(id : String, socketOptions : Dynamic) : Void;
	
	public function start() : Void;
	
	/**
	 * Check if the sockets are live
	 */
	public function isConnected() : Bool;
	
	/**
	 * Write the data out to the socket
	 */
	public function write(command : Dynamic, callback : Error -> Void) : Void;
	
	/**
	 * Force the closure of the connection
	 */
	public function close() : Void;
}