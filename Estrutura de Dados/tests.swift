//
//  tests.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 24/06/24.
//

import Foundation


func testAlgorithm(file: FileHandle, difficulty: Int, execution: () -> Void) {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution()
    let delta = DispatchTime.now().uptimeNanoseconds - t1
    
    let line = "\(difficulty) \(delta)\n"
    if let data = line.data(using: .utf8) {
        file.seekToEndOfFile()
        file.write(data)
    }
}

func getRandomArray(n: Int) -> [Int] {
    var list: [Int] = []
    for _ in 0..<n {
        list.append(Int.random(in: 0...100))
    }
    return list
}
