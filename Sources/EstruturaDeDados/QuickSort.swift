//
//  QuickSort.swift
//  
//
//  Created by Emanuel on 03/07/24.
//

import Foundation

func quickSort(v: inout [Int], s: Int, e: Int) {
    if s < e {
        let p = partition(v: &v, s: s, e: e)
        quickSort(v: &v, s: s, e: p - 1)
        quickSort(v: &v, s: p + 1, e: e)
    }
}

func partition(v: inout [Int], s: Int, e: Int) -> Int {
    var d = s - 1
    for i in s..<(e) {
        if v[i] <= v[e] {
            d += 1
            (v[d], v[i]) = (v[i], v[d])
        }
    }
    (v[d + 1], v[e]) = (v[e], v[d + 1])
    return d + 1
}
