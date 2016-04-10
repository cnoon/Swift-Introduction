
//=======================================
//              Arrays
//=======================================

// Array Literals
var genericShoppingList: Array<String> = ["Eggs", "Milk"]
var shoppingList: [String] = ["Eggs", "Milk"]
var shorthandShoppingList = ["Eggs", "Milk"]

// Accessing and modifying an array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is NOT empty.")
}

// Multiple ways to add items to the array
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)

// Retrieve values
var firstItem = shoppingList[0]
print(shoppingList)

// Modify values
shoppingList[0] = "Six Eggs"
print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

// Insert values
shoppingList.insert("Maple Syrup", atIndex: 0)
print(shoppingList)

// Remove values
let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]
print(shoppingList)

let apples = shoppingList.removeLast()
print(shoppingList)

// Iterating over an array
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

// Creating and initializing an array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3) // contains 1 value of type Int
someInts = [] // now empty array, but still of type [Int]

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

//=======================================
//             Dictionaries
//=======================================

// Create a dictionary
var longAirports: [String: String] = ["TYO": "Tokyo", "DUB": "Dublin", "PDX": "Portland"]
var airports = ["TYO": "Tokyo", "DUB": "Dublin", "PDX": "Portland"] // infers [String: String] as type

// Accessing and Modifying a Dictionary
print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is NOT empty.")
}

// Add item to dictionary
airports["LHR"] = "London"
print(airports)

// Replace item value
airports["LHR"] = "London Heathrow"
print(airports)

// Replace item value while retrieving old value
let oldLHR = airports.updateValue("London", forKey: "LHR")
if oldLHR != nil {
    let newLHR = airports["LHR"]
    print("Swapped \(newLHR!) out for \(oldLHR!) for the LHR airport")
}

// Replace item value directly in conditional
if let evenOlderLHR = airports.updateValue("London Heathrow", forKey: "LHR") {
    let newLHR = airports["LHR"]
    print("Replaced \(evenOlderLHR) with \(newLHR!) for LHR airport")
}

// Replace item value in conditional where value doesn't exist
if let oldMCI = airports.updateValue("Kansas City", forKey: "MCI") {
    let newMCI = airports["MCI"]
    print("Replaced \(oldMCI) with \(newMCI!) for MCI airport")
} else {
    let MCI = airports["MCI"]
    print("Added the \(MCI!) airport under the MCI code")
}

// Retrieving items out of the dictionary
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}

// Removing an item from a dictionary
print(airports)
airports["DUB"] = nil
print(airports)

// Removing an item from a dictionary while retrieving old item
if let removedValue = airports.removeValueForKey("LHR") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for LHR")
}

// Iterating over a dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// Iterating over the dictionary's keys
for airportCode in airports.keys {
    print("\(airportCode)")
}

// Iterating over the dictionary's values
for airportName in airports.values {
    print("\(airportName)")
}

// Storing the array of keys or values of a dictionary
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// Creating empty dictionaries
var longNamesOfIntegers = Dictionary<Int, String>()
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
namesOfIntegers = [:] // resets dictionary to be empty of type [Int: String]
print(namesOfIntegers)
