
//======================================================
//                  Protocol Syntax
//======================================================

protocol FirstProtocol {}
protocol SecondProtocol {}

struct SomeStructure: FirstProtocol, SecondProtocol {}

class SomeSuperclass {}
class SomeClass: SomeSuperclass, FirstProtocol, SecondProtocol {}

//======================================================
//                Protocol Requirements
//======================================================

// Instance property protocol
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// Type property protocol
protocol AnotherProtocol {
    class var sometTypeProperty: Int { get set }
}

// Instance property protocol
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
    var name: String
    var prefix: String?
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }

    init(name: String, prefix: String?) {
        self.name = name
        self.prefix = prefix
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName

//======================================================
//                Method Requirements
//======================================================

protocol SomeTypeProtocol {
    class func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearConguentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearConguentialGenerator()
println("Here's a random number: \(generator.random())")
println("And another one: \(generator.random())")

//======================================================
//            Mutating Method Requirements
//======================================================

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch == .Off
lightSwitch.toggle()
lightSwitch == .On

//======================================================
//              Initializer Requirements
//======================================================

protocol SomeInitProtocol {
    init(someParameter: Int)
}

class SomeInitClass: SomeInitProtocol {
    required init(someParameter: Int) {}
}

protocol SomeEmptyProtocol {
    init()
}

class SomeEmptySuperClass {
    init() {}
}

class SomeEmptySubClass: SomeEmptySuperClass, SomeEmptyProtocol {
    required override init() {}
}

//======================================================
//                 Protocols as Types
//======================================================

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearConguentialGenerator())
for _ in 1...6 {
    println("Random dice roll is \(d6.roll())")
}

//======================================================
//                     Delegation
//======================================================

println()

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearConguentialGenerator())
    var square = 0
    var board: [Int]
    var delegate: DiceGameDelegate?
    
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        
        gameloop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                break gameloop
            case let newSquare where newSquare > finalSquare:
                continue gameloop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            println("Started a new game of Snakes and Ladders")
        }
        println("The game is using a \(game.dice.sides) sided dice.")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        println("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        println("The game lasted for \(numberOfTurns) turn(s)")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

//======================================================
//     Adding Protocol Conformance with an Extension
//======================================================

println()

protocol TextRepresentable {
    func asText() -> String
}

extension Dice: TextRepresentable {
    func asText() -> String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearConguentialGenerator())
println(d12.asText())

extension SnakesAndLadders: TextRepresentable {
    func asText() -> String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

println(game.asText())

// Declaring Protocol Adoption with an Extension
struct Hamster {
    var name: String

    func asText() -> String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
println(simonTheHamster.asText())

//======================================================
//            Collections of Protocol Types
//======================================================

println()

let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    println(thing.asText())
}

//======================================================
//                Protocol Inheritance
//======================================================

println()

protocol PrettyTextRepresentable: TextRepresentable {
    func asPrettyText() -> String
}

extension SnakesAndLadders: PrettyTextRepresentable {
    func asPrettyText() -> String {
        var output = asText() + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        
        return output
    }
}

println(game.asPrettyText())

//======================================================
//               Class-Only Protocols
//======================================================

println()

protocol SomeInheritedProtocol {}
protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    // class-only protocol definition goes here...
}

//======================================================
//                Protocol Composition
//======================================================

println()

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Human: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    println("Happy Birthday \(celebrator.name) - youre \(celebrator.age)")
}

let birthdayHuman = Human(name: "Malcom", age: 23)
wishHappyBirthday(birthdayHuman)

//======================================================
//         Checking for Protocol Conformance
//======================================================

println()

@objc protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14159
    var radius: Double
    var area: Double { return pi * radius * radius }

    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double

    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int

    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        println("Area is \(objectWithArea.area)")
    } else {
        println("Something that doesn't have an area")
    }
}

//======================================================
//           Optional Protocol Requirements
//======================================================

println()

@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

@objc class Counter {
    var count = 0
    var dataSource: CounterDataSource?

    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement? {
            count += amount
        }
    }
}

class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    println(counter.count)
}

println()

class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    println(counter.count)
}
