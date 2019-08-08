//
//  SourceEditorExtension.swift
//  CommentXcodeEditorExtension
//
//  Created by daeung Kim on 2019/08/04.
//  Copyright © 2019 daeung. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
         //If your extension needs to do any work at launch, implement this optional method.
    }
    
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        return [
            [
                XCSourceEditorCommandDefinitionKey.nameKey: SourceEditorCommand.commandName,
                XCSourceEditorCommandDefinitionKey.classNameKey: SourceEditorCommand.className(),
                XCSourceEditorCommandDefinitionKey.identifierKey: SourceEditorCommand.commandIdentifier
            ]
        ]
    }
}
