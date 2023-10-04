//
//  main.swift
//  Swift_Array
//
//  Created by 이종원 on 2023/09/27.
//

import Foundation

func randomArray(size: Int) -> [Int] {
    var intArray = [Int](repeating: 0, count:size)
    
    for i in intArray.indices {
        intArray[i] = Int.random(in: 1...20)
    }
    
    return intArray
}

func arr01() {
    let intArray = randomArray(size: 10)
    print(intArray)
    print("4번째, 9번째 인덱스 합:", intArray[3] + intArray[8])
    print("모든 데이터 합:", intArray.reduce(0) { $0 + $1 } )
    print("수의 평균: ", Double(intArray.reduce(0) { $0 + $1 }) / Double(intArray.count) )
}

func arr02() {
    let intArray = randomArray(size: 10)
    print("array: ", intArray)
    print("array에 들어있는 짝수: ", intArray.filter {$0 % 2 == 0})
}

func arr03() {
    let intArray = randomArray(size: 10)
    print("array: ", intArray)
    print("array에 들어있는 홀수: ", intArray.filter {$0 % 2 == 1})
}

func arr04() {
    let intArray = randomArray(size: 10)
    print("array: ", intArray)
    print("가장 큰 값:", intArray.max()!)
}

func arr05() {
    let intArray = randomArray(size: 10)
    print("array: ", intArray)
    print("가장 작은 값:", intArray.min()!)
}

func arr06() {
    let intArray = [String](repeating: "수", count: 10)
    print("array: ", intArray)
    
}

arr06()
