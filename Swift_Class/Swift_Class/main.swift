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


//------------20231016-------------
// 불투명 반환 타입
func doubleFunc1 (value: Int) -> some Equatable {
    return value * 2
}

print(doubleFunc1(value: 4))

/*
 상속 소개 p.100
 클래스에 정의하고 어떤 특성을 그 클래스를 상속받은 다른 클래스에서 생성할 수 있게 하는 것
 부모클래스 또는 상위클래스 => (상속된 클래스) 자식클래스 또는 하위클래스
 베이스 클래스 또는 루트 클래스 : 계층구조의 최상위에 있는 클래스
 
 - 클래스의 상속 : 단일 상속
 */

// 프로퍼티 또는 인스턴스 변수
 class BankAccount {
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00

    // 저장 프로퍼티와 연산 프로퍼티
    // 연산 프로퍼티는 프로퍼티에 값을 설정하거나 가져오는 시점에서 어떤 계산이나 로직에 따라 처리된 값
    // 게터 getter , 세터 setter 메서드를 생성 p.92
    var blanceLessFees: Float {
        get {  return accountBalance - fees }
        set(newBalance) {
            accountBalance = newBalance - fees
        }
    }

    // 클리스 인스턴스 초기화
    init() {
    }

    init(number: Int, balance: Float) {
        self.accountNumber = number
        self.accountBalance = balance
    }

    // 인스턴스 메서드
    // 특정 타입의 인스턴스에서 호출하는 메서드
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }

    // 타입 메서드(Type 메서드)
    // 타입 자체에서 호출되는 메서드
    class func getMaxBlance() -> Float {
        return 100000.00
    }
}

class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    // 상속받은 메서드 오버라이딩 p.103
    override func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
        print("Prevailing interest rate is \(interestRate)")
    }
}

class Animal {
    func makeSound() {
        
    }
}

class Cat: Animal {
    init(name: String) {
        
    }
    override func makeSound() {
        print("야옹")
    }
}

class Dog: Animal {
    init(name: String) {
        
    }
    override func makeSound() {
        print("멍멍")
    }
}

class ExPerson {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func introduce() {
        print("저는 \(name)이고, \(age)살입니다.")
    }
}

class ExStudent: ExPerson {
    var grade: Int
    var classNumber: Int
    
    init(name: String, age: Int, grade: Int, classNumber: Int) {
        self.grade = grade
        self.classNumber = classNumber
        super.init(name: name, age: age)
    }
    
    override func introduce() {
        super.introduce()
        print("저는 \(grade)학년 \(classNumber)반입니다.")
    }
}

class ExTeacher: ExPerson {
    var subject: String
    
    init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
    }
    
    override func introduce() {
        super.introduce()
        print("저는 \(subject) 선생님입니다.")
    }
}

let savings1 = SavingsAccount()
savings1.displayBalance()

let cat: Animal = Cat(name: "나비")
let dog: Animal = Dog(name: "바둑")

cat.makeSound()
dog.makeSound()


let student: ExPerson = ExStudent(name: "민수", age: 15, grade: 2, classNumber: 3)
let teacher: ExPerson = ExTeacher(name: "영희", age: 25, subject: "수학")
student.introduce()
teacher.introduce()


