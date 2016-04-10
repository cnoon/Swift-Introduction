
//================================================================
//         Setting Initial Values for Stored Properties
//================================================================

// Initializers
struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature

// Default property values
struct ConciseFahrenheit {
    var temperature = 32.0
}

//================================================================
//                 Customizing Initialization
//================================================================

// Initialization parameters
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

// Local and external parameter names
struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0, 1.0, 0.0) // compiler error - external names required

// Initializer parameters without external names
struct Celsius2 {
    var temperatureInCelsius: Double
    
    init(_ celsius: Double) { // _ allows you to remove external parameter requirement
        temperatureInCelsius = celsius
    }

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bodyTemperature = Celsius2(37.0)

// Optional property types
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response
cheeseQuestion.response = "Yes, I do like cheese."
cheeseQuestion.response!

// Modifying constant properties during initialization
class SurveyQuestion2 {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
//beetsQuestion.text = "How about turnips?" // compiler error - cannot assign text
beetsQuestion.response = "I also like beets."
beetsQuestion.response!

//================================================================
//                    Default Initializers
//================================================================

// Default initializer example
class ShoppingListIngredient {
    var name: String?
    var quantity = 1
    var purchased = false
}

var ingredient = ShoppingListIngredient()

// Memberwise initializers for structure types
struct Sizer {
    var width = 0.0, height = 0.0
}

let twoByTwo = Sizer(width: 2.0, height: 2.0)

//================================================================
//           Initializer Delegation for Value Types
//================================================================

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2.0)
        let originY = center.y - (size.height / 2.0)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//================================================================
//           Class Inheritance and Initialization
//================================================================

// Designated initializers and convenience intiailizers
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let vehicle = Vehicle()
vehicle.description

let bicycle = Bicycle()
bicycle.description

// Designated and Convenience Initializers in Action
class Food {
    var name: String
    
    init(name: String) {
        print("Food init:name")
        self.name = name
    }

    convenience init() {
        print("Food convenience init")
        self.init(name: "[Unnamed]")
    }
}

class RecipeIntegredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        print("RecipeIntegredient init:name:quantity")
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String) {
        print("RecipeIntegredient convenience init:name")
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIntegredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

let oneMysteryItem = RecipeIntegredient()
let oneBacon = RecipeIntegredient(name: "Bacon")
let sixEggs = RecipeIntegredient(name: "Eggs", quantity: 6)

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}

// Required initializers
class SomeClass {
    required init() {
        // init implementation goes here
    }
}

class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation goes here
    }
}

//================================================================
//   Setting a Default Property Value with a Closure or Function
//================================================================

struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false

        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()

    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
board.squareIsBlackAtRow(0, column: 1)
board.squareIsBlackAtRow(9, column: 9)
