//
//  SourceEditorCommand.swift
//  CommentXcodeEditorExtension
//
//  Created by daeung Kim on 2019/08/04.
//  Copyright © Horing. All rights reserved.
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
    
    init?(value: String) {
        switch value {
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
        
        let buffer = invocation.buffer
        DGLog("completeBuffer \(buffer.completeBuffer)")
        DGLog("contentUTI \(buffer.contentUTI)")
        DGLog("lines \(buffer.lines)")
        DGLog("selections \(buffer.selections)")
        DGLog("indentationWidth \(buffer.indentationWidth)")
        DGLog("usesTabsForIndentation \(buffer.usesTabsForIndentation)")
        DGLog("tabWidth \(buffer.tabWidth)")
        
        
        let range = XCSourceTextRange(start: XCSourceTextPosition(line: 5, column: 12),
                                      end: XCSourceTextPosition(line: 5, column: 15))
        buffer.selections.add(range)
    }
    
    static var commandName: String {
        return className()
    }
    
    static var commandIdentifier: String {
        let bundleIdentifiler = Bundle.main.bundleIdentifier!
        return bundleIdentifiler + "." + className()
    }
}
