
//=======================================
//           Instance Methods
//=======================================

// Instance methods in a class
class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.increment()
counter.reset()

// Logical and external parameter names for methods
class AlternativeCounter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    // The default behavior above treats the method as though you wrote the
    // hash symbol (#) in front of all the parameters following the first one
    
//    func incrementBy(amount: Int, #numberOfTimes: Int) {
//        count += amount * numberOfTimes
//    }
}

let altCounter = AlternativeCounter()
altCounter.incrementBy(5, numberOfTimes: 3)

// The self property - only use self when func parameters names collide with instance property names
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("This point is to the right of the line where x == 1.0")
}

// Modifying value types from within instance methods
struct MutatingPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var mutatingPoint = MutatingPoint(x: 1.0, y: 1.0)
mutatingPoint.moveByX(2.0, y: 3.0)
mutatingPoint

// Calling mutating method on constant struct throws error
let fixedPoint = MutatingPoint(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)

// Assigning to self within a mutating method of a structure
struct MutatingSelfPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = MutatingSelfPoint(x: x + deltaX, y: y + deltaY)
    }
}

// Assigning self within a mutating method of an enumeration
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = Low
        case .Low:
            self = High
        case .High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight == .High
ovenLight.next()
ovenLight == .Off

//=======================================
//             Type Methods
//=======================================

// Types methods in a structure

struct LevelTracker {
    // Type properties
    static var highestUnlockedLevel = 1

    // Type methods
    static func unlockLevel(level: Int) {
        if level > LevelTracker.highestUnlockedLevel {
            LevelTracker.highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    // Instance properties
    var currentLevel = 1
    
    // Instance methods
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    // Instance properties
    var tracker = LevelTracker()
    let playerName: String
    
    // Instance methods
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
LevelTracker.highestUnlockedLevel

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    println("player is now at level 6")
} else {
    println("level 6 has not been unlocked yet")
}
