//
//  main.swift
//  Swift_Class
//
//  Created by 이종원 on 2023/09/26.
//

import Foundation

class PiggyBank {
    
    var accountBalance:Int = 0
    var accountLimit:Int = 0
    
    func deposit(amount:Int) {
        self.accountBalance += amount
    }
    
    func withdraw(amount:Int) {
        if(self.accountBalance >= amount){
            self.accountBalance -= amount
        } else {
            print("잔액부족!")
        }
    }
    
    func showBalance() {
        print("현재 잔액 : \(self.accountBalance)")
    }
    
    func setLimit(amount:Int) {
        self.accountLimit = amount
    }
}

class Student {
    init(name: String, number: String, age: Int, scoreSwift: Int, scoreIOS: Int, scoreWeb: Int) {
        self.name = name
        self.number = number
        self.age = age
        self.scoreSwift = scoreSwift
        self.scoreIOS = scoreIOS
        self.scoreWeb = scoreWeb
    }
    var name:String
    var number:String
    var age:Int
    var scoreSwift:Int
    var scoreIOS:Int
    var scoreWeb:Int
    
    func show(){
        print("""
\(self.name)님 안녕하세요.
[ \(self.number), \(self.age)살 ]
\(self.name)님의 Swift 점수는 \(self.scoreSwift)점 입니다.
\(self.name)님의 iOS 점수는 \(self.scoreIOS)점 입니다.
\(self.name)님의 Web 점수는 \(self.scoreWeb)점 입니다.
""")
    }
}

let student1 = Student(name: "홍길동", number: "20200677", age: 22,scoreSwift: 50,scoreIOS: 89,scoreWeb: 77)
let student2 = Student(name: "김영희", number: "20190541", age: 26,scoreSwift: 90,scoreIOS: 85,scoreWeb: 70)

student1.show()
student2.show()

class Person {
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    private var name:String
    private var age:Int
    
    func getName() {
        print("이름: ", self.name)
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getAge() {
        print("나이: ", self.age)
    }
    
    func setAge(age: Int) {
        self.age = age
    }
}

let person1 = Person(name: "홍길동", age: 25)
let person2 = Person(name: "김영희", age: 27)

class Calculator {
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    private var num1:Int
    private var num2:Int
    
    func setNum1(num1: Int) {
        self.num1 = num1
    }
    
    func setNum2(num2: Int) {
        self.num2 = num2
    }
    
    func sum() -> Int {
        return num1 + num2
    }
    
    func sub() -> Int {
        return num1 - num2
    }
    
    func mul() -> Int {
        return num1 * num2
    }
    
    func div() -> Int {
        return num1 / num2
    }
}

//let calc = Calculator(num1: 10, num2: 20)
//print(calc.sum(), calc.sub(), calc.mul(), calc.div())

class TV {
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    var name: String
    var year: Int
    var size: Int
    
    func show() -> String {
        return "\(name)에서 만든 \(year)년형 \(size)인치 TV"
    }
}

let myTV = TV(name: "LG", year: 2023, size: 48)
print( myTV.show() )

