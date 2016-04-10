
//=======================================
//         Stored Properties
//=======================================

// Constant and variable struct properties
struct FixedLengthRange {
    var start: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(start: 0, length: 3)
rangeOfThreeItems.start = 6

// Stored properties of constant structure instances
//
// NOTE: You cannot modify variable properties on constant structs b/c they
// are value types. Classes behave differently since they are reference types
let rangeOfFourItems = FixedLengthRange(start: 0, length: 4)
//rangeOfFourItems.start = 4 // reports error b/c properties are also constant

// Lazy stored properties
class DataImporter {
    // Imports data from a file and takes a while to initialize
    var fileName = "data.txt"
    // Imagine there is importing functionality here...
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // Imagine there is data management logic here...
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.fileName // importer is not initializer until here

//=======================================
//          Computed Properties
//=======================================

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2.0)
            let centerY = origin.y + (size.height / 2.0)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2.0)
            origin.y = newCenter.y - (size.height / 2.0)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
square.origin

// Shorthand setter declaration
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2.0)
            let centerY = origin.y + (size.height / 2.0)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2.0)
            origin.y = newValue.y - (size.height / 2.0)
        }
    }
}

// Read-only computed properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volume
//fourByFiveByTwo.volume = 60.0 // throws error b/c no setter exists

// More verbose getter
struct AlernativeCuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        get {
            return width * height * depth
        }
    }
}

//=======================================
//           Property Observers
//=======================================

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//=======================================
//           Type Properties
//=======================================

// Type property syntax
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 10
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 20
    }
}

class SomeClass {
    class var computedTypeProperty: Int {
        return 30
    }
}

// Querying and setting type properties
SomeClass.computedTypeProperty
SomeStructure.storedTypeProperty
SomeStructure.storedTypeProperty = "Another cooler value"
SomeStructure.storedTypeProperty

// AudioChannel example demonstrating how to use type properties
struct AudioChannel {
    static let threshhold = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            // Cap the current level if above the threshhold
            if currentLevel > AudioChannel.threshhold {
                currentLevel = AudioChannel.threshhold
            }
            
            // Update the max input level for all channels if necessary
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11
rightChannel.currentLevel
AudioChannel.maxInputLevelForAllChannels
