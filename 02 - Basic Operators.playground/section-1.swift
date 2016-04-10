
//=======================================
//             Terminology
//=======================================

//-i // Unary
//a + b // Binary
//a ? b : c // Ternary

//=======================================
//          Assignment Operator
//=======================================

let b = 10
var a = 5
a = b

let (x, y) = (1, 2)
print(x)
print(y)

//if x = y {
    // this is not valid b/c x = y does not return a value
//}

let possibleValue: Int? = 10
if let actualValue = possibleValue {
    print("this is valid")
}

//=======================================
//         Arithmetic Operators
//=======================================

// Basic arithmetic operators with numbers
1 + 2
5 - 3
2 * 3
10.0 / 2.5

// Basic arithmetic operators with strings and characters
"hello, " + "world"
var dog: Character = "*"
let cow: Character = "*"
let dogCow = String(dog) + String(cow)

//=======================================
//          Remainder Operator
//=======================================

// Integer remainders
9 % 4
-9 % 4

// Float remainders
8 % 2.5

//=======================================
//             Unary Operators
//=======================================

// Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix // pointless, never use!

//=======================================
//      Compound Assignment Operators
//
// = Assign
// *= Multiply and assign
// /= Divide and assign
// %= Remainder and assign
// += Add and assign
// -= Subtract and assign
// <<= Left bit shift and assign
// >>= Right bit shift and assign
// &= Bitwise AND and assign
// ^= Bitwise XOR and assign
// |= Bitwise OR and assign
// &&= Logical AND and assign
// ||= Logical OR and assign
//
//=======================================

var f = 1
f += 2 // equals f = f + 2
f -= 2 // equals f = f - 2

//=======================================
//          Comparison Operators
//=======================================

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"

if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

//=======================================
//      Ternary Conditional Operator
//=======================================

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//=======================================
//       Nil Coalescing Operator
//=======================================

let optionalValue: Int? = 10
var actualValue = 5
optionalValue != nil ? optionalValue! : actualValue
optionalValue ?? actualValue

let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//=======================================
//           Range Operators
//=======================================

// Closed Range Operator
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]

for index in 0..<names.count {
    print("Person \(index) is called \(names[index])")
}

//=======================================
//           Logical Operators
//=======================================

// Logical NOT operator
let allowedEntry = false

if !allowedEntry {
    print("access denied!")
}

// Logical AND operator
let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("Access Denied!")
}

// Logical OR operator
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access Denied!")
}

// Combining Logical Operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access Denied!")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access Denied!")
}
