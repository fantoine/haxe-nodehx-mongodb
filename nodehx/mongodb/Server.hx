package nodehx.mongodb;
import haxe.io.Error;

/**
 * Class representing a single MongoDB Server connection
 */
extern class Server {
	/**
	 * Options
	 * 	readPreference {String, default:null}, set’s the read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST)
	 * 	ssl {Boolean, default:false}, use ssl connection (needs to have a mongod server with ssl support)
	 * 	sslValidate {Boolean, default:false}, validate mongod server certificate against ca (needs to have a mongod server with ssl support, 2.4 or higher)
	 * 	sslCA {Array, default:null}, Array of valid certificates either as Buffers or Strings (needs to have a mongod server with ssl support, 2.4 or higher)
	 * 	sslCert {Buffer/String, default:null}, String or buffer containing the certificate we wish to present (needs to have a mongod server with ssl support, 2.4 or higher)
	 * 	sslKey {Buffer/String, default:null}, String or buffer containing the certificate private key we wish to present (needs to have a mongod server with ssl support, 2.4 or higher)
	 * 	sslPass {Buffer/String, default:null}, String or buffer containing the certificate password (needs to have a mongod server with ssl support, 2.4 or higher)
	 * 	poolSize {Number, default:5}, number of connections in the connection pool, set to 5 as default for legacy reasons.
	 * 	socketOptions {Object, default:null}, an object containing socket options to use (noDelay:(boolean), keepAlive:(number), connectTimeoutMS:(number), socketTimeoutMS:(number))
	 * 	logger {Object, default:null}, an object representing a logger that you want to use, needs to support functions debug, log, error ({error:function(message, object) {}, log:function(message, object) {}, debug:function(message, object) {}}).
	 * 	auto_reconnect {Boolean, default:false}, reconnect on error.
	 * 	disableDriverBSONSizeCheck {Boolean, default:false}, force the server to error if the BSON message is to big
	 */
	public function new(host : String, port : Int, ?options : Dynamic) : Void;
	
	/**
	 * Always ourselves
	 */
	public function setReadPreferences(readPreference : Dynamic) : Void;
	
	/**
	 * Assigns a replica set to this <code>server</code>.
	 */
	public function assignReplicaSet(replset : ReplSet) : Void;
	
	/**
	 * Takes needed options from replset and overwrites our own options.
	 */
	public function inheritReplSetOptionsFrom(replset : ReplSet) : Void;
	
	/**
	 * Opens this server connection.
	 */
	@:overload(function(dbInstance : Db, callback : Error -> Server -> Void) : Void {})
	public function connect(dbInstance : Db, options : Dynamic, callback : Error -> Server -> Void) : Void;
}