
//====================================================================
//      Optional Chaining as an Alternative to Forced Unwrapping
//====================================================================

// Optional chaining
class Actor {
    var property: Property?
}

class Property {
    var numberOfHomes = 1
}

let jerry = Actor()
//let homeCount = property!.numberOfHomes // runtime error

if let numberOfHomes = jerry.property?.numberOfHomes {
    print("John's property has \(numberOfHomes) home(s).")
} else {
    print("Unable to retrieve the number of homes.")
}

// Add a property to jerry and requery
jerry.property = Property()
if let numberOfHomes = jerry.property?.numberOfHomes {
    print("John's property has \(numberOfHomes) home(s).")
} else {
    print("Unable to retrieve the number of homes.")
}

//====================================================================
//           Defining Model Classes for Optional Chaining
//====================================================================

class Person {
    var residence: Residence?
}

class Residence {
    var address: Address?
    var rooms = [Room]()
    var numberOfRooms: Int { return rooms.count }

    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

//====================================================================
//          Accessing Properties Through Optional Chaining
//====================================================================

let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress // fails b/c residence is nil

//====================================================================
//            Calling Methods Through Optional Chaining
//====================================================================

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms")
} else {
    print("It was NOT possible to print the number of rooms")
}

if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was NOT possible to set the address.")
}

//====================================================================
//           Accessing Subscripts Through Optional Chaining
//====================================================================

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

john.residence?[0] = Room(name: "Bathroom") // fails b/c residence is nil

// Actually create a residence
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

// Accessing subscripts of optional type
var testScores = ["Dave": [86, 82, 84], "Tim": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Tim"]?[0] += 1
testScores["Brian"]?[0] = 72

var davesScores = testScores["Dave"]
davesScores?[1] = 62
testScores["Dave"] = davesScores

print(testScores)

//====================================================================
//                Link Multiple Levels of Chaining
//====================================================================

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence!.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

//====================================================================
//           Chaining on Methods with Optional Return Values
//====================================================================

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does NOT begin with \"The\".")
    }
}
