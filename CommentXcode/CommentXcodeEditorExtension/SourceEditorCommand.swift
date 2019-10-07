//
//  SourceEditorCommand.swift
//  CommentXcodeEditorExtension
//
//  Created by Daeung Kim on 2019/08/04.
//  Copyright © 2019 Horing. All rights reserved.
//

import Foundation
import XcodeKit
import DGLog

enum UTI {
    
    enum UTIError: Error {
        case unsupportedUTI
        case notExistSource
        case buffer
    }
    
    enum SwiftSource: String, CaseIterable {
        case `protocol`
        case `struct`
        case `class`
        case `enum`
        case `func`
        case `let`
        case `var`
    }
    
    enum ObjcSource {
        
    }
    
    enum PlaygroundSource {
        
    }
    
    case swift(source: SwiftSource)
    
    init(buffer: XCSourceTextBuffer) throws {
        guard let lines = buffer.lines as? [String], lines.count > 0 else {
            throw UTIError.buffer
        }
        
        guard let startRange = buffer.selections.firstObject as? XCSourceTextRange else {
            throw UTIError.buffer
        }
        
        let startLine = startRange.start.line
        let ranage = startLine ... startLine + 1
        let validIndexes = ranage.compactMap{ ($0 < lines.count) ? $0 : nil }
        let validLines = validIndexes.reduce([]) { $0 + [lines[$1]] }
        
        switch buffer.contentUTI {
        case "public.swift-source":
             typealias Tuple = (swiftSource: SwiftSource, regexResult: String.RegexResult)
             
             var tuple: Tuple?
             for line in validLines {
                let arr = try SwiftSource.allCases.compactMap({ (swiftSource) -> Tuple? in
                    if let regexResult = try line.regexResultByPattern(swiftSource.rawValue).first {
                        return (swiftSource, regexResult)
                    } else {
                        return nil
                    }
                })
                let sorted = arr.sorted { $0.regexResult.range.lowerBound < $1.regexResult.range.lowerBound }
                if let first = sorted.first {
                    tuple = first
                    break
                }
             }
             
             if let tuple = tuple {
                self = .swift(source: tuple.swiftSource)
                
             } else {
                throw UTIError.notExistSource
            }
            
        default:
            throw UTIError.unsupportedUTI
        }
    }
}

final class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        
//        let buffer = invocation.buffer
//        DGLog("completeBuffer \(buffer.completeBuffer)")
//        DGLog("contentUTI \(buffer.contentUTI)")
//        DGLog("lines \(buffer.lines)")
//        DGLog("selections \(buffer.selections)")
//        DGLog("indentationWidth \(buffer.indentationWidth)")
//        DGLog("usesTabsForIndentation \(buffer.usesTabsForIndentation)")
//        DGLog("tabWidth \(buffer.tabWidth)")
        
        defer {
            completionHandler(nil)
        }
        
        do {
            let uti = try UTI(buffer: invocation.buffer)
            DGLog(uti)

        } catch {
            DGLog(error)
        }
    }
    
    static var commandName: String {
        return className()
    }
    
    static var commandIdentifier: String {
        let bundleIdentifiler = Bundle.main.bundleIdentifier!
        return bundleIdentifiler + "." + className()
    }
}
