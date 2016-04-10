
//=======================================
//            For-In Loops
//=======================================

// Range iteration
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Range iteration while ignoring index
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

// Array iteration
let names = ["Christian", "Eric", "Jereme", "Ron"]

for name in names {
    print("Hello \(name)")
}

// Dictionary iteration (no guarantee about iteration order here...)
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// String character iteration
for character in "Hello".characters {
    print(character)
}

//=======================================
//             For Loops
//=======================================

for index in 0..<3 {
    print("index is \(index)")
}

var index: Int = 0

for _ in 0..<3 {
    print("index is \(index)")
    index += 1
}

print("The loop statements were executed \(index) times")

//=======================================
//            While Loops
//=======================================

// Basic structure
var counter = 0

while counter < 3 {
    print("I be loopin'")
    counter += 1
}

print()

//=======================================
//           Do-While Loops
//=======================================

// Basic structure
counter = 0

repeat {
    print("I be loopin'")
    counter += 1
} while counter < 3

print()

//=======================================
//            If Statements
//=======================================

// if condition
var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

// if / else condition
temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// if / else if / else condition
temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// if / else if condition
temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

//=======================================
//           Switch Statements
//=======================================

// Basic structure
let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p",
"q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

// Case statements can stack
let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// Range Matching
let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount: String

switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1_000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}

print("There are \(naturalCount) \(countedThings)")

// Tuples
let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// Tuple value binding with constants
let anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// Tuple value binding with variables (notice myPoint does not change even though the variables change)
let myPoint = (10, 20)

switch myPoint {
case (var x, 0):
    x += 1
    print("on the x-axis with an x value of \(x)")
case (0, var y):
    y += 1
    print("on the y-axis with an y value of \(y)")
case var (x, y):
    x += 1
    y -= 1
    print("somewhere else at (\(x), \(y))")
}

print("anotherPoint: (\(myPoint.0), \(myPoint.1))")

// Where clause
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is is just some arbitrary point")
}

//=======================================
//      Control Transfer Statements
//=======================================

// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

// Break
let numberSymbol: Character = "三" // Simplified Chinese for the number 3
var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "١", "一", "๑": // Latin, Arabic, Chinese, Thai values for 1
    possibleIntegerValue = 1
case "2", "٢", "二", "๒": // Latin, Arabic, Chinese, Thai values for 2
    possibleIntegerValue = 2
case "3", "٣", "三", "๓": // Latin, Arabic, Chinese, Thai values for 3
    possibleIntegerValue = 3
case "4", "٤", "四", "๔": // Latin, Arabic, Chinese, Thai values for 4
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}

print(description)

// Labeled Statements (this example could use more temp variables for readability)
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1

    if diceRoll == 7 { diceRoll = 1 }

    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}

print("Game over!")
