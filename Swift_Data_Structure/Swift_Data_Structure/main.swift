//
//  main.swift
//  Swift_Data_Structure
//
//  Created by 이종원 on 10/4/23.
//

import Foundation

func brackets() {
    var stack : [String] = []
    var result : [String] = []
    let bracketsList : [String] = ["(", ")", "{", "}", "[", "]"]
    
    var inputBracket = ""
    
    while inputBracket != "q" {
        inputBracket = readLine()!
        if bracketsList.contains(inputBracket) {
            
            result.append(inputBracket)
            
            switch inputBracket {
            case ")":
                isPopable("(")
            case "}" :
                isPopable("{")
            case "]" :
                isPopable("[")
            default:
                stack.append(inputBracket)
            }
        }
    }
    
    print(result.joined())
    print(stack, stack.isEmpty)
    
    func isPopable(_ bracket:String) {
        if(stack.last == bracket) {
            stack.removeLast()
        } else {
            stack.append(inputBracket)
        }
    }
}

func postfix() {
    //    let basicOperations : [String] = ["+", "-", "*", "/"]
    //
    //    let intArr = readLine()!.split(separator: " ").map { $0 }
    //    var inputOperations = ""
    //
    //    if basicOperations.contains(inputOperations) {
    //        switch basicOperations {
    //        case "+":
    //
    //        case "-" :
    //
    //        case "*" :
    //
    //        case "/" :
    //
    //        default:
    //            stack.append(inputBracket)
    //        }
    //        print(intArr)
    //    }
}

func bubbleSort() {
    
    var arr :[Int] = [5,3,6,2,1,7,8,9]
    var sortArr = arr
    
    for i in sortArr.indices {
        var isSorted = true
        for j in 1..<sortArr.count - i {
            if( sortArr[j] < sortArr[j-1] ) {
                sortArr.swapAt(j, j-1)
                isSorted = false
            }
        }
        if isSorted {
            break
        }
        print(i + 1, "번 순회:" ,sortArr)
    }
    arr = sortArr
    print(arr)
}

struct Song {
    let title: String
    let artist: String
    let playCount: Int
}

let song1 = Song(title: "롤린 (Rollin')", artist: "브레이브걸스", playCount: 156)
let song2 = Song(title: "Celebrity", artist: "아이유", playCount: 141)
let song3 = Song(title: "On The Ground", artist: "로제 (ROSÉ)", playCount: 35)
let song4 = Song(title:"LOVE DAY (2021)", artist:"양요섭, 정은지", playCount :94)
let song5 = Song(title:"밤하늘의 별을(2020)", artist:"경서", playCount :88)
let song6 = Song(title:"Gone", artist:"로제 (ROSÉ)", playCount :61)
let song7 = Song(title:"Dynamite", artist:"방탄소년단", playCount :111)

// 모든 노래를 배열에 넣기
var songsArray:[Int] = [song1.playCount,song2.playCount,song3.playCount,song4.playCount,song5.playCount,song6.playCount,song7.playCount]


func selectionSort(_ arr:[Int]) -> [Int] {
    var sortedArr = arr
    
    for i in 0..<sortedArr.count {
        var min = sortedArr[i]
        var minIndex = i
        for j in i..<sortedArr.count {
            if min > sortedArr[j] {
                min = sortedArr[j]
                minIndex = j
            }
        }
        sortedArr.swapAt(i, minIndex)
    }
    return sortedArr
}

print(selectionSort(songsArray))

