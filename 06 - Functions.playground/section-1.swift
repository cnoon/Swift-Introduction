
//=======================================
//    Defining and Calling Functions
//=======================================

// Create a function and call it
func sayHello(personName: String) -> String {
    let greeting = "Hello, \(personName)!"
    return greeting
}

sayHello("Christian")
sayHello("Eric")

// Combine return statement
func sayHelloAgain(personName: String) -> String {
    return "Hello again, \(personName)!"
}

sayHelloAgain("Christian")
sayHelloAgain("Eric")

//=======================================
//     Parameters and Return Values
//=======================================

// Multiple input parameters
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

halfOpenRangeLength(1, 10)

// Function without parameters
func sayHelloWorld() -> String {
    return "Hello World!"
}

sayHelloWorld()

// Functions without return values
func sayGoodbye(personName: String) {
    println("Goodbye \(personName)!")
}

sayGoodbye("Christian")

// Ignoring function return values
func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("Hello World!") // returns 12 but we ignore it
printWithoutCounting("Hello World!") // does not return value

// Multiple return values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

minMax([8, -6, 2, 109, 3, 71])

// Optional tuple return types
func minMaxWithCheck(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

//minMax([]) // runtime error
minMaxWithCheck([])
minMaxWithCheck([8, -6, 2, 109, 3, 71])

if let bounds = minMaxWithCheck([8, -6, 2, 109, 3, 71]) {
    println("min is \(bounds.min) and max is \(bounds.max)")
}

//=======================================
//           Parameter Names
//=======================================

// Local parameters
func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}

join("Hello", "World", ", ")

// External parameters
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}

join(string: "Hello", toString: "World", withJoiner: ", ")

// Shorthand external parameter names
func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    
    return false
}

let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")

// Default parameter values
func joinAgain(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}

joinAgain(string: "Hello", toString: "World", withJoiner: "-")
joinAgain(string: "Hello", toString: "World")

// External names for parameters with default values
func joinMissingExternal(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

joinMissingExternal("Hello", "World", joiner: "-")

// Variadic parameters
func average(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

average(1, 2, 3, 4, 5, 6)
average(3, 8.25, 18.75)

// Constant and variable parameters
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - countElements(string)
    if amountToPad < 1 {
        return string
    }
    
    let padString = String(pad)
    for _ in 1...amountToPad {
        string += padString
    }
    
    return string
}

let originalString = "hello"
alignRight(originalString, 10, "-")
originalString // remains unchanged

// In-out parameters
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
println("(\(someInt), \(anotherInt))")
swapTwoInts(&someInt, &anotherInt)
println("(\(someInt), \(anotherInt))")

//=======================================
//           Function Types
//=======================================

// Examples
func addTwoInts(a: Int, b: Int) -> Int { // Type = (Int, Int) -> Int
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int { // Type = (Int, Int) -> Int
    return a * b
}

// Using function types (allows you to rename functions)
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2, 3)
mathFunction = multiplyTwoInts
mathFunction(2, 3)

// Function types as parameter types
func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// Function types as return types
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
var moveCloserToZero = chooseStepFunction(currentValue > 0)

println("Counting down to zero:")
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveCloserToZero(currentValue)
}
println("zero!")

//=======================================
//           Nested Functions
//=======================================

func chooseNestedStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    
    return backwards ? stepBackward : stepForward
}

currentValue = -4
moveCloserToZero = chooseNestedStepFunction(currentValue > 0)

println("Counting down to zero:")
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveCloserToZero(currentValue)
}
println("zero!")
