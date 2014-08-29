
//=======================================
//     Comparing Classes and Structs
//=======================================

// Basic struct
struct Resolution {
    var width = 0
    var height = 0
}

// Basic class
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and structure instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing properties
someResolution.width
someVideoMode.resolution.width
someVideoMode.resolution.width = 1280
someVideoMode.resolution.width

// Memberwise initializers for structure types
let vga = Resolution(width: 640, height: 480)

//=======================================
//    Structs & Enums are Value Types
//=======================================

// Passing around structs created copies since they are value types
var hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
hd.width == cinema.width
hd.width
cinema.width

// Enums are also value types
enum CompassPoint {
    case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
rememberedDirection == .West

//=======================================
//     Classes are Reference Types
//=======================================

// Passing around class instances is by reference
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

tenEighty.frameRate == alsoTenEighty.frameRate
tenEighty.frameRate
alsoTenEighty.frameRate

// Identity Operators (identical to is different than equal to)
tenEighty === alsoTenEighty // a is identical to b - compares pointer memory address
tenEighty !== alsoTenEighty

//=======================================
//        When to use Structs???
//=======================================

// Use structs when one or more of these conditions apply
//   1) The structure’s primary purpose is to encapsulate a few relatively
//      simple data values.
//   2) It is reasonable to expect that the encapsulated values will be copied
//      rather than referenced when you assign or pass around an instance of
//      that structure.
//   3) Any properties stored by the structure are themselves value types, which
//      would also be expected to be copied rather than referenced.
//   4) The structure does not need to inherit properties or behavior from
//      another existing type.

// Examples of good candidates for structs
//   1) The size of a geometric shape, perhaps encapsulating a width property
//      and a height property, both of type Double.
//   2) A way to refer to ranges within a series, perhaps encapsulating a start
//      property and a length property, both of type Int.
//   3) A point in a 3D coordinate system, perhaps encapsulating x, y and z
//      properties, each of type Double.
