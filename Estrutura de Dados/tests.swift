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

func testAlgorithm(file: FileHandle, arr: inout [Int], difficulty: Int, execution: (inout [Int]) -> Void) {
    let t1 = DispatchTime.now().uptimeNanoseconds
    execution(&arr)
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

func getTestExecution(testName: String) -> (inout [Int]) -> Void {
    switch testName {
    case "selection-sort":
        return { (arr: inout [Int]) in
            selectionSort(v: &arr, n: arr.count)
        }
    case "insertion-sort":
        return { (arr: inout [Int]) in
            insertionSort(v: &arr, n: arr.count)
        }
    case "merge-sort":
        return { (arr: inout [Int]) in
            mergeSort(v: &arr, s: 0, e: arr.count-1)
        }
    case "quick-sort":
        return { (arr: inout [Int]) in
            quickSort(v: &arr, s: 0, e: arr.count-1)
        }
    case _:
        return { (arr: inout [Int]) in
            distributionSort(v: &arr, n: arr.count)
        }
    }
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
