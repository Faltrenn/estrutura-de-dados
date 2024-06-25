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


let fileURL = URL(fileURLWithPath: "arquivo.txt")

openFile(url: fileURL) { file in
    for i in 1...10000 {
        var arr = getTestArray(case: .BETTER, n: i)
        
        testAlgorithm(file: file, difficulty: i) {
            mergeSort(v: &arr, s: 0, e: i-1)
        }
    }
}
