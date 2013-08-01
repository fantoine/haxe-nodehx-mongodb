package nodehx.mongodb;

/**
 * A class representation of the BSON Symbol type.
 */
extern class Symbol {
	/**
	 * A class representation of the BSON Symbol type.
	 */
	public function new(value : String) : Void;
	
	/**
	 * Access the wrapped string value.
	 */
	public function valueOf() : String;
}