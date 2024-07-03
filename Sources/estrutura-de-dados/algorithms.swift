//
//  algorithms.swift
//  Estrutura de Dados
//
//  Created by Emanuel on 23/06/24.
//

import Foundation

func openFile(url: URL, execution: (FileHandle) -> Void) {
    do {
        try "".write(to: url, atomically: true, encoding: .utf8)
        let file = try FileHandle(forWritingTo: url)
        
        execution(file)
        
        file.closeFile()
    } catch {
        print(error)
    }
}
