//
//  SourceEditorCommand.swift
//  CommentXcodeEditorExtension
//
//  Created by daeung Kim on 2019/08/04.
//  Copyright © Horing. All rights reserved.
//

import Foundation
import XcodeKit

final class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        completionHandler(nil)
    }
    
    class var commandName: String {
        return className()
    }
    
    class var commandIdentifier: String {
        let bundleIdentifiler = Bundle.main.bundleIdentifier!
        return bundleIdentifiler + "." + className()
    }
}
