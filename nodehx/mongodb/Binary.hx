package nodehx.mongodb;
import nodehx.Buffer;

/**
 * A class representation of the BSON Binary type.
 */
extern class Binary {
	/**
	 * Default BSON type
	 */
	public static var SUBTYPE_DEFAULT(default, never) : Int;
	
	/**
	 * Function BSON type
	 */
	public static var SUBTYPE_FUNCTION(default, never) : Int;

	/**
	 * Byte Array BSON type
	 */
	public static var SUBTYPE_BYTE_ARRAY(default, never) : Int;

	/**
	 * OLD UUID BSON type
	 */
	public static var SUBTYPE_UUID_OLD(default, never) : Int;

	/**
	 * UUID BSON type
	 */
	public static var SUBTYPE_UUID(default, never) : Int;

	/**
	 * MD5 BSON type
	 */
	public static var SUBTYPE_MD5(default, never) : Int;

	/**
	 * User BSON type
	 */
	public static var SUBTYPE_USER_DEFINED(default, never) : Int;
	
	/**
	 * A class representation of the BSON Binary type.
	 */
	public function new(buffer : Buffer, ?subType : Int) : Void;
	
	/**
	 * Updates this binary with byte_value.
	 */
	public function put(byte_value : Int) : Void;
	
	/**
	 * Writes a buffer or string to the binary.
	 */
	@:overload(function(buffer : Buffer, offset : Int) : Void {})
	public function write(string : String, offset : Int) : Void;
	
	/**
	 * Reads length bytes starting at position.
	 */
	public function read(position : Int, length : Int) : Buffer;
	
	/**
	 * Returns the value of this binary as a string.
	 */
	public function value() : String;
	
	/**
	 * Length.
	 */
	public function length() : Int;
}