//
//  InsertionSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


public func insertionSort(v: inout [Int]) {
    insertionSort(v: &v, n: v.count)
}

func insertionSort(v: inout [Int], n: Int) {
    for i in 1..<n {
        var j = i
        while j > 0 && v[j - 1] > v[j] {
            (v[j], v[j - 1]) = (v[j - 1], v[j])
            j -= 1
        }
    }
}
