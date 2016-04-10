//
//  main.swift
//  20 - Extensions
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import Foundation

//===================================
//       Computed Properties
//===================================

print("==== Computed Properties ====")

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//===================================
//           Initializers
//===================================

print("\n==== Initializers ====")

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

    var description: String {
        return "((\(origin.x), \(origin.y)), (\(size.width), \(size.height)))"
    }
}

let defaultRect = Rect()
print("defaultRect: \(defaultRect.description)")
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print("memberwiseRect: \(memberwiseRect.description)")

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2.0)
        let originY = center.y - (size.height / 2.0)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print("centerRect: \(centerRect.description)")

//===================================
//            Methods
//===================================

print("\n==== Methods ====")

extension Int {
    func repititions(task: () -> ()) {
        for _ in 1...self { task() }
    }
}

3.repititions({
    print("Hello!")
})

3.repititions {
    print("Goodbye!")
}

// Mutating instance methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print("someInt squared: \(someInt)")

//===================================
//            Subscripts
//===================================

print("\n==== Subscripts ====")

extension Int {
    subscript(digitIndex: Int) -> Int {
        var digitIndex = digitIndex
        var decimalBase = 1

        while digitIndex > 0 {
            decimalBase *= 10
            digitIndex -= 1
        }

        return (self / decimalBase) % 10
    }
}

print("746381295[0]: \(746381295[0])")
print("746381295[1]: \(746381295[1])")
print("746381295[2]: \(746381295[2])")
print("746381295[8]: \(746381295[8])")
print("746381295[9]: \(746381295[9])") // returns 0 as if it were padded

//===================================
//           Nested Types
//===================================

print("\n==== Nested Types ====")

extension Int {
    enum Kind {
        case Negative
        case Zero
        case Positive
    }

    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ")
        case .Zero:
            print("0 ")
        case .Positive:
            print("+ ")
        }
    }

    print()
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
