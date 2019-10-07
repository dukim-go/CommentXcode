//
//  StringExtensions.swift
//  CommentXcodeEditorExtension
//
//  Created by Daeung Kim on 07/10/2019.
//  Copyright © 2019 Horing. All rights reserved.
//

import Foundation

extension String{
    func textsByRegexPattern(_ pattern: String) throws -> [String] {
        let regex = try NSRegularExpression(pattern: pattern)
        let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))

        return results.compactMap { (textCheckingResult) -> String? in
            guard let range = Range(textCheckingResult.range, in: self) else {
                return nil
            }
            return String(self[range])
        }
    }
}
