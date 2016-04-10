
//=======================================
//         Enumeration Syntax
//=======================================

// Basic multi-line structure
enum CompassPoint {
    case North
    case South
    case East
    case West
}

// Basic single line structure
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

//=======================================
//       Matching Enumeration Values
//=======================================

// Matching enum values with a switch statement that is exhaustive
directionToHead = .South

switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

// Matching enum values with a switch statement that is NOT exhaustive
let somePlanet = Planet.Earth

switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans...yet!")
}

//=======================================
//          Associated Values
//=======================================

// Enumeration where types are different and contain values
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

// Declare each associated value as a constant
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)")
case .QRCode(let productCode):
    print("QR Code: \(productCode)")
}

// Declare the entire enumeration member as a constant
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .QRCode(productCode):
    print("QR Code: \(productCode)")
}

//=======================================
//             Raw Values
//=======================================

// Enumeration members that store raw values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// Enumeration of Ints that uses auto-increment for raw values
enum PlanetRaw: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = PlanetRaw.Earth.rawValue
let possiblePlanet = PlanetRaw(rawValue: 7)

// Enumeration fromRaw method combined with optional binding
let positionToFind = 9

if let somePlanet = PlanetRaw(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans...yet!")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
