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

println("==== Computed Properties ====")

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
println("One inch is \(oneInch) meters")

let threeFeet = 3.ft
println("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
println("A marathon is \(aMarathon) meters long")

//===================================
//           Initializers
//===================================

println("\n==== Initializers ====")

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
println("defaultRect: \(defaultRect.description)")
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
println("memberwiseRect: \(memberwiseRect.description)")

extension Rect {
    init(center: Point, size: Size) {
        var originX = center.x - (size.width / 2.0)
        var originY = center.y - (size.height / 2.0)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
println("centerRect: \(centerRect.description)")

//===================================
//            Methods
//===================================

println("\n==== Methods ====")

extension Int {
    func repititions(task: () -> ()) {
        for i in 1...self {
            task()
        }
    }
}

3.repititions({
    println("Hello!")
})

3.repititions {
    println("Goodbye!")
}

// Mutating instance methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
println("someInt squared: \(someInt)")

//===================================
//            Subscripts
//===================================

println("\n==== Subscripts ====")

extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }

        return (self / decimalBase) % 10
    }
}

println("746381295[0]: \(746381295[0])")
println("746381295[1]: \(746381295[1])")
println("746381295[2]: \(746381295[2])")
println("746381295[8]: \(746381295[8])")
println("746381295[9]: \(746381295[9])") // returns 0 as if it were padded

//===================================
//           Nested Types
//===================================

println("\n==== Nested Types ====")

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
    println()
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
