package nodehx.mongodb;

/**
 * Create a new ObjectID instance
 */
extern class ObjectID {
	/**
	 * Create a new ObjectID instance
	 */
	@:overload(function(id : String) : Void {})
	@:overload(function(id : Int) : Void {})
	public function new() : Void;
	
	/**
	 * Return the ObjectID id as a 24 byte hex string representation
	 */
	public function toHexString() : String;
	
	/**
	 * Compares the equality of this ObjectID with <code>otherID</code>.
	 */
	public function equals(otherID : ObjectID) : Bool;
	
	/**
	 * Returns the generation time in seconds that this ID was generated.
	 */
	public function getTimestamp() : Int;
	
	/**
	 * Creates an ObjectID from a second based number, with the rest of the ObjectID zeroed out. 
	 * Used for comparisons or sorting the ObjectID.
	 */
	public static function createFromTime(time : Int) : ObjectID;
	
	/**
	 * Creates an ObjectID from a hex string representation of an ObjectID.
	 */
	public static function createFromHexString(hexString : String) : ObjectID;
}