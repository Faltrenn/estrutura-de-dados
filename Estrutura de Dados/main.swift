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

FileManager.default.createDirectoryIfNotExists(at: dirURL)

let testName = "insertion-sort"

for cs in Cases.allCases {
    let fileURL = dirURL.appending(path: getTestFileName(prefix: testName, cs: cs))
    let execution: (inout [Int]) -> Void = getTestExecution(testName: testName)
    
    openFile(url: fileURL) { file in
        for i in 1...1000 {
            var arr = getTestArray(cs: cs, n: i)
            
            testAlgorithm(file: file, arr: &arr, difficulty: i, execution: execution)
        }
    }
}
