//
//  main.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 21/06/24.
//

import Foundation

//var arr = [64, 25, 12, 22, 11, 13]

//selectionSort(v: &arr, n: arr.count)
//insertionSort(v: &arr, n: arr.count)
//mergeSort(v: &arr, s: 0, e: arr.count) // erro
//quickSort(v: &arr, s: 0, e: arr.count-1)
//distributionSort(v: &arr, n: arr.count)


let dirURL = URL(fileURLWithPath: "tests")
let fileURL = dirURL.appending(path: "insertion-sort-medium.txt")

FileManager.default.createDirectoryIfNotExists(at: dirURL)

openFile(url: fileURL) { file in
    for i in 1...1000 {
        var arr = getTestArray(case: .MEDIUM, n: i)
        
        testAlgorithm(file: file, difficulty: i) {
            insertionSort(v: &arr, n: i)
        }
    }
}
