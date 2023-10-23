//
//  main.swift
//  Swift_Asynchronous
//
//  Created by 이종원 on 10/20/23.
//

import Foundation

func asyncFunction() async -> Int {
    let random = Int.random(in: 1...10)
    return random
}

Task {
    await print(asyncFunction())
}

//func asyncAdd(_ x: Int, _ y: Int) async -> Int {
//    return x + y
//}

func asyncPrintSum(_ a: Int, _ b: Int) async {
    let sum = await asyncAdd(a, b)
    print(sum)
}

func fetchUser(id: Int) async -> String {
    // some network request
    return "User \(id)"
}

func printUser(id: Int) async {
    let user = await fetchUser(id: id)
    print(user)
}

await printUser(id: 10)

func asyncDouble(_ x: Int) async -> Int {
    return x * 2
}

func syncDouble(_ x: Int) async -> Int {
    return await asyncDouble(x)
}

await print(syncDouble(500))

func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum() async {
    let a = await asyncAdd(10, 20)
    let b = await asyncAdd(30, 40)
    print(a + b)
}

await asyncPrintSum()


// ------------Actor-------------


actor BuildMessage {
    var message: String = ""
    let greeting = "hello"
    
    func setName(name: String) {
        self.message = "\(greeting) \(name)"
    }
    
    // 격리에서 제외
    nonisolated func getGreeting() -> String {
        return greeting
    }
}

func someFunction() async {
    let builder = BuildMessage()
    await builder.setName(name: "Jane Smith")
    let message = await builder.message
    print(message)
}

Task {
    await someFunction()
}

