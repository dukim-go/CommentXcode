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

extension XCSourceTextBuffer {
    var replaceTest: String {
        guard lines.count > 0 else {
            return ""
        }
        
        
        
        return ""
    }
}

enum UTI {
    
    enum SwiftSource {
        case `protocol`
        case `class`
        case `struct`
        case `enum`
        case `func`
    }
    
    enum ObjcSource {
        
    }
    
    enum PlaygroundSource {
        
    }
    
    case swift(source: SwiftSource)
    
    init?(buffer: XCSourceTextBuffer) {
        guard let lines = buffer.lines as? [String], lines.count > 0 else {
            return nil
        }
        
        guard let startRange = buffer.selections.firstObject as? XCSourceTextRange else {
            return nil
        }
        
        let startLine = startRange.start.line
        let ranage = (startLine - 1) ... startLine
        let validIndexes = ranage.compactMap{ ($0 >= 0) ? $0 : nil }
        let validLines = validIndexes.reduce([]) { $0 + [lines[$1]] }
        
        switch buffer.contentUTI {
        case "public.swift-source":
            
            self = .swift(source: .class)
            
        default:
            return nil
        }
    }
}

final class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        
        enum Closing {
            case complate(Swift.Error?)
            case cancel
        }
        
        defer {
            completionHandler(nil)
        }
        
//        let buffer = invocation.buffer
//        DGLog("completeBuffer \(buffer.completeBuffer)")
//        DGLog("contentUTI \(buffer.contentUTI)")
//        DGLog("lines \(buffer.lines)")
//        DGLog("selections \(buffer.selections)")
//        DGLog("indentationWidth \(buffer.indentationWidth)")
//        DGLog("usesTabsForIndentation \(buffer.usesTabsForIndentation)")
//        DGLog("tabWidth \(buffer.tabWidth)")
        let uti = UTI.init(buffer: invocation.buffer)
    }
    
    static var commandName: String {
        return className()
    }
    
    static var commandIdentifier: String {
        let bundleIdentifiler = Bundle.main.bundleIdentifier!
        return bundleIdentifiler + "." + className()
    }
}
