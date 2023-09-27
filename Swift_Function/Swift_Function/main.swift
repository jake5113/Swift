//
//  main.swift
//  Swift_Function
//
//  Created by 이종원 on 2023/09/26.
//

import Foundation

func func01() {
    let num1 = inputNumber(order: 1)
    let num2 = inputNumber(order: 2)
    let result = addNumber(num1: num1, num2: num2)
    print("연산결과: \(result)")
}

func inputNumber(order:Int) -> Int{
    print("\(order)번째 수: ", terminator: "")
    let num = Int(readLine()!)!
    return num
}

func addNumber(num1:Int, num2:Int) -> Int {
    return num1 + num2
}

func func02() {
    let num1 = inputNumber(order: 1)
    let num2 = inputNumber(order: 2)
    print("큰 수 확인: \(largerNumbers(num1: num1, num2: num2))")
}

func largerNumbers(num1:Int, num2:Int) -> Int {
    return num1 == num2 ? -1 : (num1 - num2 > 0) ? num1 : num2
}

func func03() {
    let num1 = inputNumber(order: 1)
    let num2 = inputNumber(order: 2)
    print("10에 가까운 수: \(close10(num1: num1, num2: num2))")
    print("\(num1)의 \(num2)제곱 결과 확인: \(powerN(num1: num1, num2: num2))")
    print("\(num1)와 \(num2)의 차: \(getAbsoluteValue(num1: num1, num2: num2))")
    print("\(num2)은 \(num1)의 약수? : \(isDivisible(num1: num1, num2: num2))")
}

func close10(num1:Int, num2:Int) -> Int {
    let difference1 = abs(10 - num1)
    let difference2 = abs(10 - num2)
    return difference1 == difference2 ? 0 : difference1 < difference2 ? num1 : num2
}

func powerN(num1:Int, num2:Int) -> Int {
    var result = 1
    for _ in 1...num2 {
        result *= num1
    }
    return result
}

func getAbsoluteValue(num1:Int, num2:Int) -> Int {
    let result = num1 - num2
    return result >= 0 ? result : -result
}

func isDivisible(num1:Int, num2:Int) -> Bool {
    return num1 % num2 == 0 ? true : false
}

func getSumOfDivisors(num: Int) -> Int {
    var arr : [Int] = []
    var sum = 0
    for i in 1...num {
        if (num % i == 0) {
            arr.append(i)
            sum += i
        }
    }
    return sum
}

func printDivisor(num: Int) {
    var arr = getSumOfDivisors(num: num)
    print("\(num)의 약수 : \(arr)")
}

func printSumOfDivisors(n:Int) {
    print("\(n)의 약수의 합: \(getSumOfDivisors(num: n))")
}

printSumOfDivisors(n: 20)

func getPerfectNumber(_ num1:Int, _ num2:Int) {
    var perfectNumbers:[Int] = []
    for i in num1...num2 {
        if (getSumOfDivisors(num: i) - i == i) {
            perfectNumbers.append(i)
        }
    }
    print("\(num1)~\(num2)까지의 완전수: \(perfectNumbers)")
}

func getPrimeNumber(_ num1:Int, _ num2:Int) {
    var primeNumbers:[Int] = []
    for i in num1...num2 {
        if (getSumOfDivisors(num: i) == (i + 1)) {
            primeNumbers.append(i)
        }
    }
    print("\(num1)~\(num2)까지의 소수: \(primeNumbers)")
}

getPrimeNumber(2,30)
getPerfectNumber(2, 1000)
