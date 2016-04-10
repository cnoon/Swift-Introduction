
//=======================================
//         Closure Expressions
//=======================================

// Global Function Closure - Reverse sort an array of names
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

let names = ["Christian", "Ron", "Jereme", "Eric", "Brad", "Tom"]
var reversed = names.sort(backwards)

// Closure Expression - Reverse sort an array of names
reversed = names.sort( { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Closure Expression on a single line
reversed = names.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 })
reversed

// Closure Expression with inferred types
reversed = names.sort( { s1, s2 in return s1 > s2 })
reversed

// Closure Expression with inferred types w/o return
reversed = names.sort( { s1, s2 in s1 > s2 })
reversed

// Closure Expression with shorthand argument names
reversed = names.sort( { $0 > $1 })
reversed

// Closure Expression with Operator Functions
reversed = names.sort( >)

//=======================================
//          Trailing Closures
//=======================================

// Trailing Closure versions of Closure Expressions above
reversed = names.sort() { (s1: String, s2: String) -> Bool in return s1 > s2 }
reversed
reversed = names.sort() { s1, s2 in return s1 > s2 }
reversed
reversed = names.sort() { s1, s2 in s1 > s2 }
reversed
reversed = names.sort() { $0 > $1 }
reversed

// Trailing Closures with the Array map method
let numbers = [16, 58, 510]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let strings = numbers.map { number -> String in
    var number = number
    var output = ""

    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }

    return output
}

strings

//=======================================
//          Capturing Values
//=======================================

// Function returning a closure that has captured values
func makeIncrementor(forAmount amount: Int) -> Void -> Int {
    var runningTotal = 0

    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }

    return incrementor
}

let incrementByTen = makeIncrementor(forAmount: 10)
let incrementBySeven = makeIncrementor(forAmount: 7)
incrementByTen()
incrementBySeven()
incrementByTen()
incrementBySeven()
incrementByTen()
incrementBySeven()

// Closures are reference types
let alsoIncrementByTen = incrementByTen // point to same closure
alsoIncrementByTen()
incrementByTen()
alsoIncrementByTen()
