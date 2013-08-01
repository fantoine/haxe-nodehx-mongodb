package nodehx.mongodb;

/**
 * Defines a Long class for representing a 64-bit two’s-complement integer value, which faithfully 
 * simulates the behavior of a Java “Long”. This implementation is derived from LongLib in GWT.
 */
extern class Long {
	/**
	 * Constructs a 64-bit two’s-complement integer, given its low and high 32-bit values as signed integers. 
	 * See the from* functions below for more convenient ways of constructing Longs.
	 * The internal representation of a Long is the two given signed, 32-bit values. We use 32-bit pieces because 
	 * these are the size of integers on which Javascript performs bit-operations. For operations like addition 
	 * and multiplication, we split each number into 16-bit pieces, which can easily be multiplied within Javascript’s 
	 * floating-point representation without overflow or change in sign.
	 * In the algorithms below, we frequently reduce the negative case to the positive case by negating the input(s) 
	 * and then post-processing the result. Note that we must ALWAYS check specially whether those values are 
	 * MIN_VALUE (-2^63) because -MIN_VALUE == MIN_VALUE (since 2^63 cannot be represented as a positive number, 
	 * it overflows back into a negative). Not handling this case would often result in infinite recursion.
	 */
	public function new(low : Int, high : Int) : Void;
	
	/**
	 * Return the int value.
	 */
	public function toInt() : Int;
	
	/**
	 * Return the Number value.
	 */
	public function toNumber() : Float;
	
	/**
	 * Return the JSON value.
	 */
	public function toJSON() : String;
	
	/**
	 * Return the String value.
	 */
	public function toString() : String;
	
	/**
	 * Return the high 32-bits value.
	 */
	public function getHighBits() : Int;
	
	/**
	 * Return the low 32-bits value.
	 */
	public function getLowBits() : Int;
	
	/**
	 * Return the low unsigned 32-bits value.
	 */
	public function getLowBitsUnsigned() : Int;
	
	/**
	 * Returns the number of bits needed to represent the absolute value of this Long.
	 */
	public function getNumBitsAbs() : Int;
	
	/**
	 * Return whether this value is zero.
	 */
	public function isZero() : Bool;
	
	/**
	 * Return whether this value is negative.
	 */
	public function isNegative() : Bool;
	
	/**
	 * Return whether this value is odd.
	 */
	public function isOdd() : Bool;
	
	/**
	 * Return whether this Long equals the other
	 */
	public function equals(other : Long) : Bool;
	
	/**
	 * Return whether this Long does not equal the other.
	 */
	public function notEquals(other : Long) : Bool;
	
	/**
	 * Return whether this Long is less than the other.
	 */
	public function lessThan(other : Long) : Bool;
	
	/**
	 * Return whether this Long is less than or equal to the other.
	 */
	public function lessThanOrEqual(other : Long) : Bool;
	
	/**
	 * Return whether this Long is greater than the other.
	 */
	public function greaterThan(other : Long) : Bool;
	
	/**
	 * Return whether this Long is greater than or equal to the other.
	 */
	public function greaterThanOrEqual(other : Long) : Bool;
	
	/**
	 * Compares this Long with the given one.
	 */
	public function compare(other : Long) : Int;
	
	/**
	 * The negation of this value.
	 */
	public function negate() : Long;
	
	/**
	 * Returns the sum of this and the given Long.
	 */
	public function add(other : Long) : Long;
	
	/**
	 * Returns the difference of this and the given Long.
	 */
	public function substract(other : Long) : Long;
	
	/**
	 * Returns the product of this and the given Long.
	 */
	public function multiply(other : Long) : Long;
	
	/**
	 * Returns this Long divided by the given one.
	 */
	public function div(other : Long) : Long;
	
	/**
	 * Returns this Long modulo the given one.
	 */
	public function modulo(other : Long) : Long;
	
	/**
	 * The bitwise-NOT of this value.
	 */
	public function not() : Long;
	
	/**
	 * Returns the bitwise-AND of this Long and the given one.
	 */
	public function and(other : Long) : Long;
	
	/**
	 * Returns the bitwise-OR of this Long and the given one.
	 */
	public function or(other : Long) : Long;
	
	/**
	 * Returns the bitwise-XOR of this Long and the given one.
	 */
	public function xor(other : Long) : Long;
	
	/**
	 * Returns this Long with bits shifted to the left by the given amount.
	 */
	public function shiftLeft(numBits : Int) : Long;
	
	/**
	 * Returns this Long with bits shifted to the right by the given amount.
	 */
	public function shiftRight(numBits : Int) : Long;
	
	/**
	 * Returns this Long with bits shifted to the right by the given amount, with the new top bits matching the current sign bit.
	 */
	public function shiftRightUnsigned(numBits : Int) : Long;
	
	/**
	 * Returns a Long representing the given (32-bit) integer value.
	 */
	public static function fromInt(value : Int) : Long;
	
	/**
	 * Returns a Long representing the given value, provided that it is a finite number. Otherwise, zero is returned.
	 */
	public static function fromNumber(value : Float) : Long;
	
	/**
	 * Returns a Long representing the 64-bit integer that comes by concatenating the given high and low bits. 
	 * Each is assumed to use 32 bits.
	 */
	public static function fromBits(lowBits : Int, highBits : Int) : Long;
	
	/**
	 * Returns a Long representation of the given string, written using the given radix.
	 */
	public static function fromString(str : String, opt_radix : Int) : Long;
	
}