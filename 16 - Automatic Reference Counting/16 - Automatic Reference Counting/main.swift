//
//  main.swift
//  16 - Automatic Reference Counting
//
//  Created by Christian Noon on 8/30/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import Foundation

//=======================================================================
//                           ARC in Action
//=======================================================================

println("==== ARC in Action ====")

class Actor {
    let name: String
    
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var reference1: Actor?
var reference2: Actor?
var reference3: Actor?

reference1 = Actor(name: "Chris Pratt")
reference2 = reference1
reference3 = reference1

reference1 = nil
println("nil'd out reference1")
reference2 = nil
println("nil'd out reference2")
reference3 = nil
println("nil'd out reference3")

//=======================================================================
//            Strong Reference Cycles Between Class Instances
//=======================================================================

println("\n==== Strong Reference Cycles Between Class Instances ====")

// Strong Reference Cycle Example
class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

class Apartment {
    let number: Int
    var tenant: Person?
    
    init(number: Int) {
        self.number = number
    }
    deinit {
        println("Apartment #\(number)")
    }
}

var john: Person?
var number73: Apartment?

john = Person(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john

john = nil
number73 = nil
println("john and number73 do NOT get deinitialized due to strong reference cycle!!!")

//=======================================================================
//        Resolving Strong Reference Cycles Between Class Instances
//=======================================================================

println("\n==== Resolving Strong Reference Cycles Between Class Instances ====")

// Weak references example
class Person2 {
    let name: String
    var apartment: Apartment2?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

class Apartment2 {
    let number: Int
    weak var tenant: Person2?
    
    init(number: Int) {
        self.number = number
    }
    deinit {
        println("Apartment #\(number) is being deinitialized")
    }
}

var john2: Person2?
var number732: Apartment2?

john2 = Person2(name: "John Appleseed")
number732 = Apartment2(number: 73)

john2!.apartment = number732
number732!.tenant = john2

john2 = nil
number732 = nil

//=======================================================================
//                        Unowned References
//=======================================================================

println("\n==== Unowned References ====")

class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        println("Card #\(number) is being deinitialized")
    }
}

var jerry: Customer? = Customer(name: "Jerry Steele")
jerry!.card = CreditCard(number: 1234_5678_9012_3456, customer: jerry!)

jerry = nil

//=======================================================================
//    Unowned References and Implicitly Unwrapped Optional Properties
//=======================================================================

println("\n==== Unowned References and Implicitly Unwrapped Optional Properties ====")

class Country {
    let name: String
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var country: Country? = Country(name: "Canada", capitalName: "Ottawa")
println("Country: \"\(country!.name)\" with Capital City: \"\(country!.capitalCity.name)\"")
country = nil

//=======================================================================
//                Strong Reference Cycles for Closures
//=======================================================================

println("\n==== Strong Reference Cycles for Closures ====")

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
let htmlClosure = paragraph!.asHTML
println(htmlClosure())

paragraph = nil
println("paragraph is not deinitialized b/c the closure is holding onto paragraph")

//=======================================================================
//          Resolving Strong Reference Cycles for Closures
//=======================================================================

println("\n==== Resolving Strong Reference Cycles for Closures ====")

class HTMLElement2 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String?) {
        self.name = name
        self.text = text
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
let htmlClosure2 = paragraph2!.asHTML
println(htmlClosure2())
paragraph2 = nil
