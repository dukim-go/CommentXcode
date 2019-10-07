//
//  StringExtensions.swift
//  CommentXcodeEditorExtension
//
//  Created by Daeung Kim on 07/10/2019.
//  Copyright © 2019 Horing. All rights reserved.
//

import Foundation

extension String {
    typealias RegexResult = (text: String, range: Range<String.Index>)
    
    func regexResultByPattern(_ pattern: String) throws -> [RegexResult] {
        let regex = try NSRegularExpression(pattern: pattern)
        let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))

        return results.compactMap { (textCheckingResult) -> RegexResult? in
            guard let range = Range(textCheckingResult.range, in: self) else {
                return nil
            }
            return RegexResult(text: String(self[range]), range: range)
        }
    }
}
