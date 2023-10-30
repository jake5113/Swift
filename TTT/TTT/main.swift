//
//  main.swift
//  TTT
//
//  Created by 이종원 on 10/25/23.
//

import Foundation

var green: String = "green"// struct의 인스턴스
var copyGreen: String = green
// MARK: - Stack 메모리 영역 주소 출력하는 메서드
func printStackAddress(input: inout String) {
    withUnsafePointer(to: &input) { pointer in
        print("Stack address is \(pointer)")
    }
}

// MARK: - Heap 메모리 영역 주소 출력하는 메서드
func printHeapAddress(address input: UnsafeRawPointer) {
    print(String(format: "Heap address is %p", Int(bitPattern: input)))
}

printStackAddress (input: &copyGreen)
printHeapAddress(address: copyGreen)
copyGreen = "copyGreen"
printStackAddress(input: &green)
printHeapAddress(address: green)

printStackAddress (input: &copyGreen)
printHeapAddress(address: copyGreen)
// Cow (Copy on Write)
