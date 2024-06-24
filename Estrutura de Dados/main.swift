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


for i in 1...1000 {
    var arr = getRandomArray(n: i)
    print(testAlgorithm {
        distributionSort(v: &arr, n: arr.count)
    })
}
