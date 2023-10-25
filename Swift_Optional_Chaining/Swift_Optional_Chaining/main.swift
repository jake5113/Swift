//
//  main.swift
//  Swift_Optional_Chaining
//
//  Created by 이종원 on 10/25/23.
//

import Foundation

// 1
struct Person {
    var name: String?
    var age: Int?
}

var person: Person? = Person(name: nil, age: 25)

print(person?.name ?? "no value")
print(person?.age as Any)

// 2
struct Author {
    var name: String?
}

struct Book {
    var title: String?
    var author: Author?
}

var book: Book? = Book(title: "The Little Prince", author: Author(name: "Antoine de Saint-Exupéry"))

print(book?.title as Any)              // The Little Prince
print(book?.author?.name ?? "")

// 3
var numbers: [Int]? = [1, 2, 3]

print((numbers?[0])! + 10)


// 4
var students: [String: Int]? = ["Kim": 90, "Lee": 80, "Park": 85]

print(students?["Lee"] ?? 0 + 1)


// 5
class Animal {
    func speak() {
        print("...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}

var animal: Animal? = Dog()
animal?.speak()

// 6
struct Matrix {
    var elements: [[Int]]

    func transpose() -> Matrix {
        var result = [[Int]]()
        for i in 0..<elements[0].count {
            var row = [Int]()
            for j in 0..<elements.count {
                row.append(elements[j][i])
            }
            result.append(row)
        }
        return Matrix(elements: result)
    }
}

var matrix: Matrix? = Matrix(elements: [[1, 2, 3], [4, 5, 6]])
print(matrix?.transpose().elements ?? 1)

// 7
var numbers7: [Int]? = [1, 2, 3, 4, 5]

print(numbers7?.reduce(0, +) ?? 0)
numbers7 = nil
print(numbers7?.reduce(0, +) ?? 0)

// 8
struct Student {
    var name: String
    var score: Int
}

var students8: [Student]? = [Student(name: "Kim", score: 80),
                            Student(name: "Lee", score: 90),
                            Student(name: "Park", score: 85)]

print((students8?.reduce(into: 0) { $0 += $1.score } ?? 0) / 3)
