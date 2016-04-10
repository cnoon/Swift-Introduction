
//=======================================
//         Constants and Variables
//=======================================

// Constants use let
let maximumNumberOfInputs = 10

// Variables use var
var str = "Hello, playground"
var currentLoginAttempts = 0
var x = 0.0, y = 0.0, z = 1.0

// Defining multiple values as a type
var red, green, blue: Double

// Variable without initial value
var welcomeMessage: String
//println(welcomeMessage) // errors if used before initialized
welcomeMessage = "Hello, Christian"

// Changing Variable Values
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour!"

// Changing Constant Values (cannot do it)
let languageName = "Swift"
//languageName = "ObjC" // Compiler error

// println adds a newline at the end
print(languageName)
print(languageName)

//=======================================
//              Comments
//=======================================

// Comment 1
/* Comment 2 */

//=======================================
//              Semicolons
//=======================================

let cat = "[]" ; print(cat)

//=======================================
//              Integers
//=======================================

// Int Bounds
let minValue = UInt8.min
let maxValue = UInt8.max

// Int Sizes
let value8bits: UInt8 = 27
let value16bits: UInt16 = 27
let value32bits: UInt32 = 27
let value64bits: UInt64 = 27

// Numbers
var decimalValue = 3.14159 // Double by default
var decimalValueFloat: Float = 3.14159
var anotherPi = 3 + 0.14159 // this will be a double also
var binaryInteger = 0b001010
var octalInteger = 0o21
var hexadecimalInteger = 0x42

// Numeric literals
let decimalDouble = 12.123_456
let bigValue = 1_000_000_123.123

//=======================================
//        Numeric Type Conversions
//=======================================

// Up-converting ints
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Down-converting doubles to ints
let three = 3 // Integer
let pointOneFourOneFiveNine = 0.14159 // Double
let piDouble = Double(three) + pointOneFourOneFiveNine
let piInteger = three + Int(pointOneFourOneFiveNine)

//=======================================
//             Type Aliases
//=======================================

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
var minAmplitudeFound = AudioSample.max

//=======================================
//               Booleans
//=======================================

let orangesAreOrange = true
let turnipsAreDelicious = false

// Can only evaluate booleans in conditionals
if turnipsAreDelicious {
    print("Mmmm, tasty turnips")
} else {
    print("Ewww, turnips are horrible")
}

let i = 1
if i == 1 {
    print("Magic")
}

//=======================================
//               Tuples
//=======================================

// Create a tuple
let http404Error = (404, "Not Found")
print(http404Error)

// Pull all values back out
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// Pull only one value back out
let (onlyStatusCode, _) = http404Error
print("The status code is \(statusCode)")

// Access individual elements of the tuple w/o pulling them out
print("The status code is \"\(http404Error.0)\"")
print("The status message is \"\(http404Error.1)\"")

// Name individual tuple elements
let http200Status = (statusCode: 200, description: "OKAY")
print("The status code is \"\(http200Status.statusCode)\"")
print("The description is \"\(http200Status.description)\"")

//=======================================
//              Optionals
//=======================================

// Convert string to int
let possibleNumber = "123"
let convertedNumber: Int? = Int(possibleNumber)
print("Integer: \(convertedNumber)")

// You can only nil out an optional
var serverResponseCode: Int? = 404
serverResponseCode = nil
var actualResponseCode = 404
//actualResponseCode = nil // throws compiler error

// Optionals w/o a value default to nil
var surveyAnswer: String?

// If statements and forced unwrapping
if convertedNumber != nil {
    print("convertedNumber contains integer.")
}

if convertedNumber != nil {
    print("convertedNumber == \(convertedNumber)") // still an optional
    print("convertedNumber == \(convertedNumber!)") // grabs the integer value
}

// Optional binding
if let actualNumber = Int(possibleNumber){
    print("\(possibleNumber) has an integer value of \(actualNumber)")
}
else {
    print("\(possibleNumber) could not be converted to an integer")
}

// Implicitly unwrapped optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires the exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

//=======================================
//              Assertions
//=======================================

let age = -3
//assert(age >= 0, "A person's age cannot be less than zero") // will trigger assert
