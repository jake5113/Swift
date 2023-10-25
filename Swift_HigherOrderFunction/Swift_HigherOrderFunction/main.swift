//
//  main.swift
//  Swift_HigherOrderFunction
//
//  Created by 이종원 on 10/24/23.
//

import Foundation

// 맵, 필터, 리듀스 예제 01
// 주어진 배열에서 홀수만 골라내서 제곱한 후 모두 더하는 함수를 작성하세요.
func ex01() {
    func sumOfSquaresOfOdds(array: [Int]) -> Int {
        array.filter { $0 % 2 != 0 }.reduce(into:0){$0 += $1 * $1}
    }

    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print(sumOfSquaresOfOdds(array: array))
}

// 주어진 문자열에서 모음을 제거하고 대문자로 바꾼 후 역순으로 출력하는 함수를 작성하세요.
func ex02() {
    func reverseWithoutVowels(string: String) -> String {
        let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        return String(string.filter {!vowels.contains(String($0))}.uppercased().reversed())
    }

    let string = "Hello World"
    print(reverseWithoutVowels(string: string))
}

// 주어진 딕셔너리에서 값이 짝수인 키들의 합을 구하는 함수를 작성하세요.
func ex03() {
    func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
        return dictionary.values.filter { $0 % 2 == 0 }.reduce(0) { $0 + $1 }
    }

    let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
    print(sumOfKeysWithEvenValues(dictionary: dictionary))
}

// 주어진 배열에서 가장 큰 수와 가장 작은 수의 차이를 구하는 함수를 작성하세요.
func ex04() {
    func differenceBetweenMaxAndMin(array: [Int]) -> Int { Int(array.max()!) - Int(array.min()!) }
    let array = [10, 20, 30, 40, 50]
    print(differenceBetweenMaxAndMin(array: array))
}

// **********주어진 배열에서 각 요소의 개수를 세어서 딕셔너리로 반환하는 함수를 작성하세요.
func ex05() {
    func countElements(array: [String]) -> [String: Int] {
        array.reduce(into: [:]){ $0[$1, default: 0] += 1 }
    }
    
    let array = ["a", "b", "a", "c", "b", "d"]
    
    print( countElements(array: array) )   // ["b": 2, "d": 1, "c": 1, "a": 2]
}

//**************주어진 배열에서 가장 많이 등장하는 요소를 반환하는 함수를 작성하세요. 만약 동률이 있다면 무작위로 하나를 반환.
func ex06() {
//    func mostFrequentElement(array: [String]) -> String {
//        var a = array.reduce(into: [:]){ $0[$1, default: 0] += 1 }
//    }
    _ = ["a", "b", "a", "c", "b", "d"]
//    print( mostFrequentElement(array: array) )   // a
}

// 주어진 배열에서 각 요소의 앞뒤로 "*"을 붙여서 새로운 배열을 반환하는 함수를 작성하세요.
func ex07() {
    func addStars(array: [String]) -> [String] { array.map{"*" + $0 + "*"} }
    let array = ["a", "b", "c"]
    print( addStars(array: array) )   // ["*a*", "*b*", "*c*"]
}

func ex08() {
    func sumOfMultiplesOfThree(array: [Int]) -> Int {
//        array.filter{$0 % 3 == 0}.reduce(into:0) {$0 += $1}
        array.filter{$0 % 3 == 0}.reduce(into:0, +=) //reduce(0, +)
    }
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print( sumOfMultiplesOfThree(array: array) )   // 18
}

// ****************주어진 배열에서 각 요소를 두 번 반복해서 새로운 배열을 반환하는 함수를 작성하세요.
func ex09() {
    func repeatTwice(array: [String]) -> [String] {
        array.flatMap { [$0] + [$0] }
    }
    let array = ["a", "b", "c"]
    print( repeatTwice(array: array))   // ["a", "a", "b", "b", "c", "c"]
}

// 주어진 배열에서 각 요소의 길이를 새로운 배열로 반환하는 함수를 작성하세요.
func ex10() {
    func lengthsOfElements(array: [String]) -> [Int] { array.map { $0.count } }

    let array = ["apple", "banana", "cherry"]
    print( lengthsOfElements(array: array))   // [5, 6, 6]
}

// 주어진 문자열에서 모음(a, e, i, o, u)의 개수를 세는 함수를 작성하세요.
func ex11() {
    func countVowels(_ word:String) -> Int{
        let vowels = "AEIOUaeiou"
        return word.filter {vowels.contains($0)}.count
    }
    
    let word = "swift"
    let vowelCount = countVowels(word)
    print(vowelCount) // 1
}

// 주어진 문자열에서 각 알파벳이 몇 번 나오는지 세는 함수를 작성하세요.
func ex12() {
    func countAlphabets(_ word: String) -> [Character:Int]{
        word.filter{$0.isLetter}.reduce(into:[:]){ $0[$1, default: 0] += 1}
    }
    
    let word = "Hello2World!!"
    let alphabetCount = countAlphabets(word)
    print(alphabetCount)  // ["e": 1, "o": 2, "r": 1, "H": 1, "W": 1, "d": 1, "l": 3]
}

// ********* 주어진 문자열에서 각 단어의 첫 글자를 대문자로 바꾸는 함수를 작성하세요.
func ex13() {
    func capitalize(_ sentence: String) -> String {
        sentence.split(separator: " ").map{ $0.capitalized }.joined(separator: " ")
    }
    
    let sentence = "this is a test"
    let capitalizedSentence = capitalize(sentence)
    print(capitalizedSentence)      // "This Is A Test"
}

// 주어진 배열에서 각 요소를 역순으로 정렬하는 함수를 작성하세요. (컬렉션에서 제공하는 역순함수를 사용하지 않고 구현해 보세요.)
func ex14() {
    func reverse(_ numbers: [Int]) -> [Int] {
        numbers.reduce(into:[]){$0.insert($1, at: 0)}
    }
    
    let numbers = [1, 3, 4, 2, 5]
    let reversedNumbers = reverse(numbers)
    print(reversedNumbers)      // [5, 2, 4, 3, 1]
}

// 주어진 문자열에서 모든 소문자를 대문자로 바꾸는 함수를 작성하세요. (보너스: 대문자는 소문자로 소문자는 대문자로 시도해 보세요.)
func ex15() {
    func uppercase(_ word: String) -> String {
        word.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }.joined()
    }
    let word = "swiftSWIFTsWiFt"
    let uppercasedWord = uppercase(word)
    print(uppercasedWord)       // "SWIFT"
}

// 주어진 문자열에서 모든 공백을 제거하는 함수를 작성하세요.
func ex16() {
    func removeSpaces(_ sentence: String) -> String{
        sentence.filter{ $0.isLetter }
    }
    
    let sentence = "This is a test"
    let noSpaceSentence = removeSpaces(sentence)
    print(noSpaceSentence)      // "Thisisatest"
}

ex15()
