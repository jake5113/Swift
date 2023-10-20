//
//  main.swift
//  Swift_Error_Handling
//
//  Created by 이종원 on 10/18/23.
//

import Foundation

/* # 여러 핸들링 소개 p.133
 발생할 수 있는 모든 에러에 대한 처리
 - 원하는 결과가 나오지 않을 경우에 에러를 발생 (스로잉 throwing)
 - 메서드가 던진(throwing) 에러를 잡아서 처리
 
 defer 구문 p.138
 - 현재 코드블럭이 종료되기 직전에 수행되는 작업을 지정 (정리작업)
 
 */

enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

let connetionOK = true
let connectionSpeed = 31.00
let fileFound = false

func fileTransfer() throws {
    
    guard connetionOK else {
        throw FileTransferError.noConnection
    }
    
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

func sendFile() -> String {
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return("No Network Connection")
    } catch FileTransferError.lowBandwidth {
        return("File Transfer Speed too Low")
    } catch FileTransferError.fileNotFound {
        return("File not Found")
    } catch {
        return("Unknow error")
    }
    
    return ("Succesful transfer")
}

print(sendFile())

func ex01() {
    
    enum TemperatureError: Error {
        case invalidTemperature
    }
    
    func celsiusToFahrenheit(_ celsius: Float) throws -> Float {
        let fahrenheit: Float = celsius * 1.8 + 32
        guard fahrenheit >= -273.15 else {
            throw TemperatureError.invalidTemperature
        }
        return fahrenheit
    }
    
    do {
        let fahrenheit = try celsiusToFahrenheit(-300)
        print(fahrenheit)
    } catch TemperatureError.invalidTemperature {
        print("Invalid temperature")
    } catch {
        print("Error")
    }
}

func ex02() {
    let symbols = "!@#$%^&*()_+-=[]{}|;:,./<>?"
    
    enum PasswordError: Error {
        case tooShort, missingUppercase, missingLowercase, missingNumber, missingSymbol
    }
    
    func validatePassword(_ pw: String) throws {
        guard pw.count >= 8 else {
            throw PasswordError.tooShort
        }
        
        guard pw.contains(where: {$0.isUppercase} ) else {
            throw PasswordError.missingUppercase
        }
        
        guard pw.contains(where: {$0.isLowercase} ) else {
            throw PasswordError.missingLowercase
        }
        
        guard pw.contains(where: {$0.isNumber} ) else {
            throw PasswordError.missingNumber
        }
        
        guard (pw.rangeOfCharacter(from: CharacterSet(charactersIn: symbols)) != nil) else {
            throw PasswordError.missingSymbol
        }
        print(pw)
    }
    
    do {
        try validatePassword("12Aa.b1234")
    } catch let error as PasswordError {
        switch error {
        case .tooShort:
            print("Password is too short")
        case .missingUppercase:
            print("Password is missing an uppercase letter")
        case .missingLowercase:
            print("Password is missing a lowercase letter")
        case .missingNumber:
            print("Password is missing a number")
        case .missingSymbol:
            print("Password is missing a symbol")
        }
    } catch {
        print("Undefined Error")
    }
}

func ex03() {
    
    enum ATMError: Error {
        case negativeAmount, insufficientBalance
    }
    
    class ATM {
        var balance: Double = 0
        
        func deposit(amount: Double) {
            if amount > 0 {
                balance += amount
            }
        }
        
        func withdraw(amount: Double) throws -> Double {
            guard amount > 0 else {
                throw ATMError.negativeAmount
            }
            
            guard amount <= balance else {
                throw ATMError.insufficientBalance
            }
            
            balance -= amount
            return amount
        }
    }
    
    let atm = ATM()
    atm.deposit(amount: 1000)
    print("현재 잔액:", atm.balance)              // 1000.0
    
    do {
        let cash = try atm.withdraw(amount: 300)
        print("출금:", cash)                 // 500.0
    } catch let error as ATMError {
        switch error {
        case .negativeAmount:
            print("Cannot withdraw a negative amount")
        case .insufficientBalance:
            print("Cannot withdraw more than balance")
        }
    } catch {
        print("ERROR")
    }
    
    print("출금 후 잔액:", atm.balance)
}

func ex04() {
    
    enum CalculatorError: Error {
        case divisionByZero
    }
    
    struct Calculator {
        var result: Double = 0
        mutating func add(_ number: Double) {
            result += number
        }
        
        mutating func subtract(_ number: Double) {
            result -= number
        }
        
        mutating func multiply(_ number: Double) {
            result *= number
        }
        
        mutating func divide(_ number: Double) throws {
            guard number != 0 else {
                throw CalculatorError.divisionByZero
            }
            result /= number
        }
    }
    
    var calculator = Calculator()
    calculator.add(10)
    print(calculator.result)        // 10.0
    
    calculator.subtract(3)
    print(calculator.result)        // 7.0
    
    calculator.multiply(2)
    print(calculator.result)        // 14.0
    
    do {
        try calculator.divide(7)
        print(calculator.result)    // 2.0
    } catch CalculatorError.divisionByZero {
        print("Cannot divide by zero")
    } catch {
        print("ERROR")
    }
}

func ex05() {
    
    enum LibraryError: Error {
        case bookNotFound, limitExceeded
    }
    
    class Library {
        
        var books: [String]
        var limit = 3
        
        init(books: [String] = [], limit: Int = 3) {
            self.books = books
            self.limit = limit
        }
        
        func borrow(books: [String]) throws -> String {
            
            guard books.count <= limit else {
                throw LibraryError.limitExceeded
            }
            
            guard self.books.contains(books) else {
                throw LibraryError.bookNotFound
            }

            
            return books.joined(separator: ", ")
        }
    }
    let library = Library(books: ["Harry Potter", "The Little Prince", "The Hobbit"], limit: 2)
    
    do {
        let result = try library.borrow(books: ["Harry Potter", "The Little Prince"])
        print(result)
    } catch LibraryError.bookNotFound {
        print("책을 찾을 수 없습니다.")
    } catch LibraryError.limitExceeded {
        print("대출 한도를 초과했습니다.")
    } catch {
        print("ERROR")
    }
    // limit: 1 일 경우 대출 한도를 초과했습니다.
    // limit: 2 일 경우 The Harry Potter, Little Prince을 대출했습니다.
}

ex05()

