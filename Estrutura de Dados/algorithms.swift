//
//  algorithms.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 23/06/24.
//

import Foundation

func openFile(url: URL, execution: (FileHandle) -> Void) {
    do {
        try "".write(to: fileURL, atomically: true, encoding: .utf8)
        let file = try FileHandle(forWritingTo: fileURL)
        
        execution(file)
        
        file.closeFile()
    } catch {
        print(error)
    }
}

func selectionSort(v: inout [Int], n: Int) {
    for i in 0..<n-1 {
        var m = i
        for j in (i+1)..<n {
            if v[m] > v[j] {
                m = j
            }
        }
        if m != i {
            (v[i], v[m]) = (v[m], v[i])
        }
    }
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

func mergeSort(v: inout [Int], s: Int, e: Int) {
    if s < e {
        let m = (s+e)/2
        mergeSort(v: &v, s: s, e: m)
        mergeSort(v: &v, s: m+1, e: e)
        merge(v: &v, s: s, m: m, e: e)
    }
}

func merge(v: inout [Int], s: Int, m: Int, e: Int) {
    var p = s
    var q = m + 1
    var w: [Int] = []
    for _ in 0..<(e - s + 1) {
        if (q > e) || ((p <= m) && (v[p] < v[q])) {
            w.append(v[p])
            p += 1
        } else {
            w.append(v[q])
            q += 1
        }
    }
    for i in (0..<(e - s + 1)) {
        v[s + i] = w[i]
    }
}

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
