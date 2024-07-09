//
//  main.swift
//
//
//  Created by Emanuel on 03/07/24.
//

import Foundation
import EstruturaDeDados



extension FileManager {
    func directoryExists(at: URL) -> Bool {
        var isDirectory : ObjCBool = true
        let exists = FileManager.default.fileExists(atPath: at.path(percentEncoded: false), isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    public func createDirectoryIfNotExists(at: URL) {
        if !directoryExists(at: at) {
            do{
                try FileManager.default.createDirectory(at: at, withIntermediateDirectories: false)
            } catch {
                print(error)
            }
        }
    }
}
