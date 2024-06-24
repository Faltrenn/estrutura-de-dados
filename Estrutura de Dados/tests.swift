//
//  tests.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 24/06/24.
//

import Foundation


func testAlgorithm(execution: () -> Void) -> UInt64 {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution()
    return DispatchTime.now().uptimeNanoseconds - t1
}

func getRandomArray(n: Int) -> [Int] {
    var list: [Int] = []
    for _ in 0..<n {
        list.append(Int.random(in: 0...100))
    }
    return list
}
