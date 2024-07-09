//
//  SelectionSort.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation


func selectionSort(v: inout [Int]) {
    selectionSort(v: &v, n: v.count)
}

func selectionSort(v: inout [Int], n: Int) {
    for i in 0..<n-1 {
        var m = i
        for j in (i+1)..<n {
            if v[m] > v[j] {
                m = j
            }
        }
        (v[i], v[m]) = (v[m], v[i])
    }
}
