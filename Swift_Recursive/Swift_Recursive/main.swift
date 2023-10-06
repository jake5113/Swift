//
//  main.swift
//  Swift_Recursive
//
//  Created by 이종원 on 10/6/23.
//

import Foundation

func quickSort(_ arr:[Int]) -> [Int] {
    var leftArr : [Int] = []
    var rightArr : [Int] = []
    
    for i in arr.indices {
        if arr[i] < arr[(arr.count / 2)] {
            leftArr.append(arr[i])
        } else if arr[i] > arr[(arr.count / 2)]{
            rightArr.append(arr[i])
        }
    }
    
    var isSorted = leftArr.isEmpty && rightArr.isEmpty
    if isSorted {
        return arr
    }
    
    if !leftArr.isEmpty {
        leftArr = quickSort(leftArr)
    }
    if !rightArr.isEmpty {
        rightArr = quickSort(rightArr)
    }
    
    var sortedArr : [Int] = []
    sortedArr += leftArr
    sortedArr.append(arr[arr.count / 2])
    sortedArr += rightArr
    
    return sortedArr
}

print(quickSort([1,5,7,8,9,3,2]))
print(quickSort([21,30,151,2,8,44,98,101,3]))

