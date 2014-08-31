
//=======================================
//    The Problem That Generics Solve
//=======================================

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(inout a: String, inout b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt: \(someInt) anotherInt: \(anotherInt)")

//=======================================
//           Generic Functions
//=======================================

println()

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

someInt = 3
anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
println("someInt: \(someInt) anotherInt: \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
println("someString: \(someString) anotherString: \(anotherString)")

//=======================================
//         Naming Type Parameters
//=======================================

// Always give type parameters UpperCamelCase names (such as T and KeyType)
// to indicate that they are a placeholder for a type, not a value.

//=======================================
//             Generic Types
//=======================================

println()

struct IntStack {
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items = [T]()
    var isEmpty: Bool { return items.isEmpty }
    
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()

stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

while !stackOfStrings.isEmpty {
    let fromTheTop = stackOfStrings.pop()
    println(fromTheTop)
}

//=======================================
//       Extending a Generic Type
//=======================================

println()

extension Stack {
    var topItem: T? {
        return items.last
    }
}

stackOfStrings.push("uno")
stackOfStrings.push("dos")

if let topItem = stackOfStrings.topItem {
    println("The top item on the stack is \(topItem)")
}

//=======================================
//            Type Constraints
//=======================================

println()

// Type constraint syntax
class SomeClass {}
protocol SomeProtocol {}

// T must inherit from SomeClass, U must conform to SomeProtocol
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here...
}

// Type constraints in action
func findStringIndex(array: [String], valueToFind: String) -> Int? {
    for (index, value) in enumerate(array) {
        if value == valueToFind {
            return index
        }
    }

    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    println("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in enumerate(array) {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

if let foundIndex = findIndex(strings, "llama") {
    println("The index of llama is \(foundIndex)")
}

let doubleIndex = findIndex([3.14159, 0.1, 0.25], 9.3)
println(doubleIndex)

let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")
println(stringIndex)

//=======================================
//           Associated Types
//=======================================

println()

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct SuperStack<T>: Container {
    var items = [T]()
    var isEmpty: Bool { return items.isEmpty }
    
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }

    // Container Protocol Conformance
    mutating func append(item: T) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

var superstack = SuperStack<String>()
superstack.push("Toast")
superstack.push("Ham")
superstack.append("Eggs")
superstack.append("Bacon")
let bacon = superstack.pop()

println(superstack.count)
println(superstack[1])
println(superstack[2])

// Extending an existing type to specify an associated type
extension Array: Container {}

//=======================================
//            Where Clauses
//=======================================

println()

func allItemsMatch<T1: Container, T2: Container
    where T1.ItemType == T2.ItemType, T1.ItemType: Equatable>
    (someContainer: T1, anotherContainer: T2) -> Bool {
    if someContainer.count != anotherContainer.count {
        return false
    }

    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    return true
}

var stringSuperStack = SuperStack<String>()
stringSuperStack.push("uno")
stringSuperStack.push("dos")
stringSuperStack.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stringSuperStack, arrayOfStrings) {
    println("All items match")
} else {
    println("Not all items match.")
}
