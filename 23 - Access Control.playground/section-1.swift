
//=======================================================
//                Access Control Syntax
//=======================================================

public class PublicClass {}
internal class InternalClass {}
private class PrivateClass {}

public var publicVariable = 0
internal let internalConstant = 0
private func privateFunction() {}

class ImplicitlyInternalClass {} // implicitly internal
var ImplicitlyInternalConstant = 0 // implicitly internal

//=======================================================
//                    Custom Types
//=======================================================

public class SomePublicClass {          // explicitly public class
    public var somePublicProperty = 0   // explicitly public class member
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicityly private class member
}

class SomeInternalClass {               // implicitly internal class
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

private class SomePrivateClass {        // explicitly private class
    var somePrivateProperty = 0         // implicityly private class member
    func somePrivateMethod() {}         // implicityly private class member
}

//=======================================================
//                   Tuple Types
//=======================================================

// Must be defined as private since it's return type contains a private type
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    return (SomeInternalClass(), SomePrivateClass())
}

//=======================================================
//                Enumeration Types
//=======================================================

public enum CompassPoint {
    case North, South, East, West
}

// NOTE: the raw and associated values must have the same access level
// as the enum itself

//=======================================================
//                   Subclassing
//=======================================================

public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod() // only works when A and B defined in same source file
    }
}

//=======================================================
//    Constants, Variables, Properties and Subscripts
//=======================================================

// Getters and Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct PublicTrackedString {
    public private(set) var numberOfEdits = 0

    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
