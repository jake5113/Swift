//
//  main.swift
//  Swift_Generic
//
//  Created by 이종원 on 11/7/23.
//

import Foundation

func ex01() {
    // 예시 코드:
    struct Stack<T> {
        var items = [T]()
        mutating func push(_ item: T) {
            items.append(item)
        }
        mutating func pop() -> T {
            return items.removeLast()
        }
    }
    
    var intStack = Stack<Int>()
    intStack.push(3)
    intStack.push(5)
    print(intStack.pop()) // 5
    
    var stringStack = Stack<String>()
    stringStack.push("Hello")
    stringStack.push("World")
    print(stringStack.pop())
}

func ex02() {
    // 예시 코드:
    var a = 10
    var b = 20
    swap(&a, &b)
    print(a, b) // 20, 10
}

func ex03() {
    
    struct Stack<T> {
        var items = [T]()
        mutating func push(_ item: T) {
            items.append(item)
        }
        
        mutating func pop() -> T {
            return items.removeLast()
        }
        
        mutating func peek() -> T {
            return items.last!
        }
        
        var isEmpty: Bool {
            return items.isEmpty
        }
    }
    
    // 예시 코드:
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    print(stack.pop())   // 3
    print(stack.peek())  // 2
    print(stack.isEmpty) // false
}

func ex04() {
    
    struct Queue<T> {
        
        var items = [T]()
        
        mutating func enqueue(_ item: T) {
            items.append(item)
        }
        
        mutating func dequeue() -> T {
            var result = items.first!
            items.removeFirst()
            return result
        }
        
        func front() -> T {
            return items.first!
        }
        
        var isEmpty: Bool {
            return items.isEmpty
        }
        
    }
    
    // 예시 코드:
    var queue = Queue<String>()
    queue.enqueue("A")
    queue.enqueue("B")
    queue.enqueue("C")
    print(queue.dequeue()) // A
    print(queue.front()) // B
    print(queue.isEmpty) // false
}

func ex05() {
    func printType<T> (_ input: T) {
        print(T.self)
    }
    
    printType(3) // The type of 3 is Int
    printType("Hello") // The type of Hello is String
    printType(true) // The type of true is Bool
}

func ex06() {
    
    struct Node<T, S> {
       
        var key: T
        var value: S
        
        
        init (key: T, value: S) {
            self.key = key
            self.value = value
        }
    }
    
    let node = Node(key: "name", value: "Alice")
    print(node.key) // name
    print(node.value) // Alice
}

func ex07() {
    
    func isEqual<T: Equatable> (_ item1: T, _ item2: T) -> Bool {
        return item1 == item2
    }
    
    print(isEqual(1, 1)) // true
    print(isEqual("Hello", "World")) // false
    print(isEqual(true, false)) // false
}


ex07()

