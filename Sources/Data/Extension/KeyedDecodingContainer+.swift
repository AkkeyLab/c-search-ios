//
//  KeyedDecodingContainer+.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import Extension
import Foundation

extension KeyedDecodingContainer {
    func decodeDate(forKey: KeyedDecodingContainer.Key) throws -> Date {
        try date(
            forKey: forKey,
            dateString: try decode(String.self, forKey: forKey)
        )
    }

    func decodeDateIfPresent(forKey: KeyedDecodingContainer.Key) throws -> Date? {
        guard let string = try decodeIfPresent(String.self, forKey: forKey),
              !string.isEmpty else {
            return nil
        }

        return try date(forKey: forKey, dateString: string)
    }

    private func date(forKey: KeyedDecodingContainer.Key, dateString: String) throws -> Date {
        let fromTemplate = "yyyy-MM-dd"
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter().apply {
            $0.calendar = calendar
            $0.locale = .jp
            $0.dateFormat = DateFormatter.dateFormat(
                fromTemplate: fromTemplate,
                options: .zero,
                locale: .jp
            )
        }

        guard let date = formatter.date(from: dateString) else {
            let text = "The date format should be \(fromTemplate), but it is \(dateString)"
            throw DecodingError.dataCorruptedError(
                forKey: forKey,
                in: self,
                debugDescription: text
            )
        }

        return date
    }
}
