
//=======================================
//         Defining a Base Class
//=======================================

// Base Class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing
    }
}

let someVehicle = Vehicle()
someVehicle.description

//=======================================
//             Subclassing
//=======================================

// Bicycle subclass
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
bicycle.description

// Tandem subclass
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description

//=======================================
//             Overridding
//=======================================

// Overridding methods
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// Overriding properties
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
car.description

// Overridding property observers
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
automatic.description

// Preventing overrides for entire class
final class MuscleCar: Car {
    var color: String?
}

//class Camaro: MuscleCar {} // compiler error since MuscleCar is final

// Preventing overrides for methods, properties, or subscripts
class ManualCar: Car {
    final var tireWidth: Double = 0.0
    final override func makeNoise() {
        print("Waahhh waahhh")
    }
}

class Ferari: ManualCar {
//    override var tireWidth: Double {} // compiler error since tireWidth is final
}
