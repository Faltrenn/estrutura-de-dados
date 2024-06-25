//
//  tests.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 24/06/24.
//

import Foundation


enum Cases: CaseIterable {
    case BETTER, MEDIUM, WORST
    
    var fileSuffix: String {
        get {
            switch self {
            case .BETTER:
                "better"
            case .MEDIUM:
                "medium"
            case .WORST:
                "worst"
            }
        }
    }
}

func getTestFileName(prefix: String, cs: Cases) -> String {
    "\(prefix)-\(cs.fileSuffix).txt"
}

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

func getTestArray(cs: Cases, n: Int) -> [Int]{
    switch cs {
    case .BETTER:
        Array(0..<n)
    case .MEDIUM:
        getRandomArray(n: n)
    case .WORST:
        Array((0..<n).reversed())
    }
}

func getRandomArray(n: Int) -> [Int] {
    var list: [Int] = []
    for _ in 0..<n {
        list.append(Int.random(in: 0...100))
    }
    return list
}

extension FileManager {
    func directoryExists(at: URL) -> Bool {
        var isDirectory : ObjCBool = true
        let exists = FileManager.default.fileExists(atPath: at.path(percentEncoded: false), isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    func createDirectoryIfNotExists(at: URL) {
        if !directoryExists(at: at) {
            do{
                try FileManager.default.createDirectory(at: at, withIntermediateDirectories: false)
            } catch {
                print(error)
            }
        }
    }
}
