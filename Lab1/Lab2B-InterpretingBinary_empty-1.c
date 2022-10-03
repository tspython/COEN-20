#include <stdint.h>

static const char digits[] = "0123456789ABCDEF";

void Bits2HexString(uint8_t bits, char string[]) { // radix 16
	unsigned int nibblel = bits >> 4; // we can simply right shift 4 bits to get the first half of the hex number
	unsigned int nibble2 = bits & 0b00001111; //use bitwise & to get last 4 bits or ssecond half of the hex number
	//store in string
	string[0] = digits[nibblel];
	string[1] = digits[nibble2];
	string[2] = '\0';
}

void Bits2OctalString(uint8_t bits, char string[]) { // radix 8
	unsigned int nibblel = bits >> 6;  //shift right 6 to get first two bits for first part of octal grouping
	unsigned int nibble2 = (bits & 0b00111000) >> 3; // shift right 3 to get the second octal grouping
	unsigned int nibble3 = bits & 0b00000111; //use bitwise & to shift third octal grouping
	//store in string
	string[0] = digits[nibblel];
	string[1] = digits[nibble2];
	string[2] = digits[nibble3];
	string[3] = '\0';
}


void Bits2UnsignedString(uint8_t bits, char string[]) { // radix 10
	unsigned int dec100 = bits / 100; // obtain 100 place digit
	bits = bits - (dec100 * 100); // get rid of 100 place digit
	unsigned int dec10 = bits / 10 ; // obtain 10 place digit
	bits = bits - (dec10 * 10); // get rid of 10 place digit
	unsigned int dec1 = bits; // obtain 1 place digit

	//store in string
	string[0] = digits[dec100];
	string[1] = digits[dec10];
	string[2] = digits[dec1];
	string[3] = '\0';
}

/*
void Bits2SignMagString(uint8_t bits, char string[]){
	// Implement Me
}

void Bits2TwosCompString(uint8_t bits, char string[]){
	// Implement Me
}
*/