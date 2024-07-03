//
//  DistributionSort.swift
//  
//
//  Created by Emanuel on 03/07/24.
//

import Foundation

func distributionSort(v: inout [Int], n: Int) {
    let s = v.min()!
    let b = v.max()!
    var c: [Int] = []
    var w: [Int] = []
    for _ in 0..<(b - s + 2) {
        c.append(0)
    }
    for i in 0..<n {
        c[v[i] - s + 1] = c[v[i] - s + 1] + 1
        w.append(0)
    }
    for i in 1..<(b - s + 2) {
        c[i] += c[i - 1]
    }
    for i in 0..<n {
        let d = v[i] - s + 1
        w[c[d] - 1] = v[i]
        c[d] -= 1
    }
    for i in 0..<n {
        v[i] = w[i]
    }
}
