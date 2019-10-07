//
//  SourceEditorExtension.swift
//  CommentXcodeEditorExtension
//
//  Created by Daeung Kim on 2019/08/04.
//  Copyright © 2019 Horing. All rights reserved.
//

import Foundation
import XcodeKit
import DGLog

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
         DGLog()
    }
    
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        return [
            [
                .nameKey: SourceEditorCommand.commandName,
                .classNameKey: SourceEditorCommand.className(),
                .identifierKey: SourceEditorCommand.commandIdentifier
            ]
        ]
    }
}
