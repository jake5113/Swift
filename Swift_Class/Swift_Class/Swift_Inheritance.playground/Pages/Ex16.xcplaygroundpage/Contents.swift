//: [Previous](@previous)

import Foundation

class Animal {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func cry() {
        print(name, age, terminator: "")
    }
}

class Cat: Animal {
    var meow: String
    init(name: String, age: Int, meow: String) {
        self.meow = meow
        super.init(name: name, age: age)
    }
    override func cry() {
        super.cry()
        print(meow, "울어요")
    }
}

class Dog: Animal {
    var bark: String
    init(name: String, age: Int, bark: String) {
        self.bark = bark
        super.init(name: name, age: age)
    }
    override func cry() {
        super.cry()
        print(bark, "짖어요")
    }
}

class Duck: Dog {
    
}

let kitty = Cat(name: "나비", age: 3, meow: "야옹")
let puppy = Dog(name: "초코", age: 2, bark: "멍멍")
let duck = Duck(name: "멋쟁", age: 2, bark: "꽥꽥")

let animals: [Animal] = [kitty, puppy, duck]
animals[0].cry()
animals[1].cry()
animals[2].cry()
for ani in animals { ani.cry() }
