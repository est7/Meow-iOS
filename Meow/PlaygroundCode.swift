//
//  File.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation

protocol Nameable {
    func name() -> String
}

func f<T: Nameable>(x: T) {
    print("Name is " + x.name())
}


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


func greet(person: [String: String]) {
    if let name = person["name"] {
        print("Hello \(name)")
        
        if let location = person["location"] {
            print("weather is nice in \(location).")
        } else {
            print("weather is nice near you.")
        }
    } else {
        print("Hello stranger")
    }
}

func greet1(person: [String: String]) {
    guard let name = person["name"] else {
        print("Hello stranger")
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("weather is nice near you.")
        return
    }
    
    print("weather is nice in \(location).")
}

struct Person {
    var name: String
    var age: Int
}

func main(){
    let person = Person(name: "Alice", age: 30)
    let a = person.name
    let nameKeyPath = \Person.name
    print(person[keyPath: nameKeyPath]) // 输出: Alice
}


actor BankAccount {
    var balance: Double = 0.0
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) -> Bool {
        if balance >= amount {
            balance -= amount
            return true
        } else {
            return false
        }
    }
}

let account = BankAccount()

