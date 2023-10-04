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

postfix()
