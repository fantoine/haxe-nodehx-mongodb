package nodehx.mongodb;
import nodehx.Buffer;

/**
 * Create a new BSON instance
 */
extern class BSON {
	/**
	 * Number BSON Type
	 */
	public static var BSON_DATA_NUMBER(default, never) : Int;
	
	/**
	 * String BSON Type
	 */
	public static var BSON_DATA_STRING(default, never) : Int;
	
	/**
	 * Object BSON Type
	 */
	public static var BSON_DATA_OBJECT(default, never) : Int;
	
	/**
	 * Array BSON Type
	 */
	public static var BSON_DATA_ARRAY(default, never) : Int;
	
	/**
	 * Binary BSON Type
	 */
	public static var BSON_DATA_BINARY(default, never) : Int;
	
	/**
	 * ObjectID BSON Type
	 */
	public static var BSON_DATA_OID(default, never) : Int;
	
	/**
	 * Boolean BSON Type
	 */
	public static var BSON_DATA_BOOLEAN(default, never) : Int;
	
	/**
	 * Date BSON Type
	 */
	public static var BSON_DATA_DATE(default, never) : Int;
	
	/**
	 * null BSON Type
	 */
	public static var BSON_DATA_NULL(default, never) : Int;
	
	/**
	 * RegExp BSON Type
	 */
	public static var BSON_DATA_REGEXP(default, never) : Int;
	
	/**
	 * Code BSON Type
	 */
	public static var BSON_DATA_CODE(default, never) : Int;
	
	/**
	 * Symbol BSON Type
	 */
	public static var BSON_DATA_SYMBOL(default, never) : Int;
	
	/**
	 * Code with Scope BSON Type
	 */
	public static var BSON_DATA_CODE_W_SCOPE(default, never) : Int;
	
	/**
	 * 32 bit Integer BSON Type
	 */
	public static var BSON_DATA_INT(default, never) : Int;
	
	/**
	 * Timestamp BSON Type
	 */
	public static var BSON_DATA_TIMESTAMP(default, never) : Int;
	
	/**
	 * Long BSON Type
	 */
	public static var BSON_DATA_LONG(default, never) : Int;
	
	/**
	 * MinKey BSON Type
	 */
	public static var BSON_DATA_MIN_KEY(default, never) : Int;
	
	/**
	 * MaxKey BSON Type
	 */
	public static var BSON_DATA_MAX_KEY(default, never) : Int;
	
	/**
	 * Binary Default Type
	 */
	public static var BSON_BINARY_SUBTYPE_DEFAULT(default, never) : Int;
	
	/**
	 * Binary Function Type
	 */
	public static var BSON_BINARY_SUBTYPE_FUNCTION(default, never) : Int;
	
	/**
	 * Binary Byte Array Type
	 */
	public static var BSON_BINARY_SUBTYPE_BYTE_ARRAY(default, never) : Int;
	
	/**
	 * Binary UUID Type
	 */
	public static var BSON_BINARY_SUBTYPE_UUID(default, never) : Int;
	
	/**
	 * Binary MD5 Type
	 */
	public static var BSON_BINARY_SUBTYPE_MD5(default, never) : Int;
	
	/**
	 * Binary User Defined Type
	 */
	public static var BSON_BINARY_SUBTYPE_USER_DEFINED(default, never) : Int;

	/**
	 * Create a new BSON instance
	 */
	public function new() : Void;
	
	/**
	 * Calculate the bson size for a passed in Javascript object.
	 */
	public static function calculateObjectSize(object : Dynamic, ?serializeFunction : Bool) : Int;
	
	/**
	 * Serialize a Javascript object using a predefined Buffer and index into the buffer, 
	 * useful when pre-allocating the space for serialization.
	 */
	public static function serializeWithBufferAndIndex(object : Dynamic, checkKeys : Bool, buffer : Buffer, index : Int, ?serializeFunctions : Bool) : Int;
	
	/**
	 * Serialize a Javascript object.
	 */
	public static function serialize(object : Dynamic, checkKeys : Bool, asBuffer : Bool, ?serializeFunctions : Bool) : Buffer;
	
	/**
	 * Deserialize stream data as BSON documents.
	 * Options
	 * 	evalFunctions {Boolean, default:false}, evaluate functions in the BSON document scoped to the object deserialized.
	 * 	cacheFunctions {Boolean, default:false}, cache evaluated functions for reuse.
	 * 	cacheFunctionsCrc32 {Boolean, default:false}, use a crc32 code for caching, otherwise use the string of the function.
	 */
	public static function deserializeStream(data : Buffer, startIndex : Int, numberOfDocuments : Int, documents : Array<Dynamic>, docStartIndex : Int, ?options : Dynamic) : Int;
	
	/**
	 * Deserialize data as BSON.
	 * Options
	 * 	evalFunctions {Boolean, default:false}, evaluate functions in the BSON document scoped to the object deserialized.
	 * 	cacheFunctions {Boolean, default:false}, cache evaluated functions for reuse.
	 * 	cacheFunctionsCrc32 {Boolean, default:false}, use a crc32 code for caching, otherwise use the string of the function.
	 */
	public static function deserialize(buffer : Buffer, ?options : Dynamic, ?isArray : Bool) : Dynamic;
}