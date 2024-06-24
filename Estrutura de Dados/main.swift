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


for i in 1...1 {
    var arr = getRandomArray(n: 5)
    print(arr)
    print(testAlgorithm {
        mergeSort(v: &arr, s: 0, e: arr.count-1)
    })
    print(arr)
}
