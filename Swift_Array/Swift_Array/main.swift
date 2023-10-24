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

func arr() {
    var _: [String:String] = [:]
    var bookDict1 = ["A":"123"]
    _ = [String:String]()
    
    bookDict1["B"] = "111"
    print(bookDict1)
    bookDict1["A"] = nil
    print(bookDict1)
    
    // 딕셔너리 항목 조회(반복)
    for (bookid, title) in bookDict1 {
        print(bookid, title)
    }
    
    // 두 개의 배열을 이용하여 딕셔너리를 생성 p.130
    let keys = ["100-43211", "200-53876", "202-56458"]
    let values = ["Wind", "Apple", "Android"]
    
    let books = Dictionary(uniqueKeysWithValues: zip(keys, values))
    print(books)
}

func exArr01() {

}

func exArr02() {
    func reverseKeyValue(dict: [String: String]) -> [String: String] {
        var newDict = [String: String]()
        dict.forEach {
            newDict[$0.value] = $0.key
        }
        return newDict
    }

    let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
    let result = reverseKeyValue(dict: dict2)
    print(dict2)
    print(result)
}

func exArr03() {
    func keysWithValue(dict: [String: Int], value: Int) -> [String] {
        var result: [String] = []
        dict.forEach {
            if ($0.value == value) {
                result.append($0.key)
            }
        }
        return result
    }

    let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
    let result = keysWithValue(dict: dict3, value: 2)
    print(result)
}

func exArr04() {
    func dictToString(dict: [String: Any]) -> String {
        var result = ""
        dict.forEach {
            result += $0.key + ":" + String(describing: $0.value) + ", "
        }
        result.removeLast(2)
        return result
    }

    let dict4: [String: Any] = ["name": "Alice", "age": 20, "gender": "female"]
    let result = dictToString(dict: dict4)
    print(result)
}

func exArr05() {
    func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
        var a:Int = 0
        var b:Int = 0
        dict.forEach {
            a += $0.key
            b += $0.value
        }
        return (a, b)
    }

    let dict5 = [1: 10, 2: 20, 3: 30]
    let result = sumOfKeysAndValues(dict: dict5)
    print(result)
}

func exArr06() {
    let person = ["name": "Kim", "age": 25, "job": "programmer"] as [String : Any]
    print(person["name"]!)
}

func exArr07() {
    let fruit = ["apple": 3, "banana": 5, "orange": 2]
    for (key, value) in fruit {
        print(key, value)
    }
}

func exDict08() {
    let scores = ["math": 90, "english": 100, "science": 95, "math1": 99]
    var maxScore = 0
    var maxKey: String = ""
    for (k, v) in scores {
        if v > maxScore {
            maxScore = v
            maxKey = k
        }
    }
    print(maxKey)
}

func exDict09() {
    let colors = ["red": "#FF0000", "green": "#00FF00", "blue": "#0000FF"]
    func swapKeyValue(_ dict:[String:String]) -> [String:String] {
        var newDict: [String:String]
        newDict = Dictionary(uniqueKeysWithValues: zip(dict.values, dict.keys))
        return newDict
    }
    print(swapKeyValue(colors))
}

func exDict10() {
    let dict1 = ["a": 1, "b": 2, "c": 3]
    let dict2 = ["b": 2, "c": 4, "d": 5]
    
    for (key, value) in dict1 {
        if let value2 = dict2[key] {
            print("\(key):\(value)")
            print("\(key):\(value2)")
        }
    }
}

func exDict11() {
    var even = ["a": 2, "b": 3, "c": 4, "d": 5]
    for (key, value) in even {
        if value % 2 == 0 {
            even[key] = nil
        }
    }
    print(even)
}

func exDict12() {
    let countries = ["KR": "South Korea", "US": "United States", "JP": "Japan", "CN": "China"]
    let sortedKeys = countries.keys.sorted()
    print(sortedKeys)
}

exDict12()

func sets() {
    var letters = Set<Character>()
    
    letters.insert("c")
    letters.insert("c")
    letters.insert("b")
    print(letters)
    
    letters.remove("c")
    print(letters)
    
    // 집합 연산 (배열과 차이)
    let odd: Set = [1, 3, 5, 7, 9]
    let even: Set = [0, 2, 4, 6, 8]
    let single: Set = [2, 3, 5, 7]
    
    var a = odd.union(even).sorted()    // 합집합
    var b = odd.subtracting(single)     // 차집합, 특정 집합의 공통된 값을 제외한 새로운 집합을 생성
    var c = odd.intersection(single)    // 교집합, 공통된 값으로 새로운 집합을 생성
    var d = odd.symmetricDifference(single) //여집합, 공통된 값을 제외한 새로운 집합을 생성
}

func exSet01() {
    func intersect(_ setA: Set<Int>, _ setB: Set<Int>) -> Set<Int> {
        return setA.intersection(setB)
    }
    
    let setA: Set<Int> = [1, 2, 3, 4, 5]
    let setB: Set<Int> = [3, 4, 5, 6, 7]
    let intersection = intersect(setA, setB)
    print(intersection.sorted()) // [3, 4, 5]
}

func exSet02() {
    func unite(_ setA: Set<String>, _ setB: Set<String>) -> Set<String> {
        return setA.union(setB)
    }
    
    let setC: Set<String> = ["apple", "banana", "cherry"]
    let setD: Set<String> = ["cherry", "durian", "elderberry"]
    let union = unite(setC, setD)
    print(union.sorted()) // ["apple", "banana", "cherry", "durian", "elderberry"]
}

func exSet03() {
    func subtract(_ setA: Set<Double>, _ setB: Set<Double>) -> Set<Double> {
        return setA.subtracting(setB)
    }
    
    let setE: Set<Double> = [1.0, 2.0, 3.0, 4.0, 5.0]
    let setF: Set<Double> = [2.0, 4.0, 6.0]
    let difference = subtract(setE, setF)
    print(difference.sorted()) // [1.0, 3.0, 5.0]
}

func exSet04() {
    func disjoint(_ setA: Set<Character>, _ setB: Set<Character>) -> Bool {
        if setA.intersection(setB).isEmpty {
            return true
        }
        return false
    }
    let setG: Set<Character> = ["a", "b", "c"]
    let setH: Set<Character> = ["d", "e", "f"]
    let isDisjoint = disjoint(setG, setH)
    print(isDisjoint) // true
}

