//
//  SearchCorporateGateway.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import APIKit
import ArkanaKeys
import Data
import Foundation

public protocol SearchCorporateGatewayProtocol {
    func search(name: String) async throws -> CorporationsEntity
}

public final class SearchCorporateGateway: SearchCorporateGatewayProtocol {
    private let sessionAdapter: SessionAdapter

    public init(sessionAdapter: SessionAdapter) {
        self.sessionAdapter = sessionAdapter
    }

    public init() {
        let configuration = URLSessionConfiguration.default
        sessionAdapter = URLSessionAdapter(configuration: configuration)
    }

    public func search(name: String) async throws -> CorporationsEntity {
        guard let fullWidthString = name.applyingTransform(.fullwidthToHalfwidth, reverse: true) else {
            throw SearchCorporateError.emptyCorporateName
        }
        let apiKey = ArkanaKeys.Global().nationalTaxAgencyApiKey
        let request = CorporateRequest(
            apiKey: apiKey,
            name: fullWidthString,
            type: .unicodeXML,
            mode: .partialMatch,
            kind: .normal,
            hasClosed: false
        )
        return try await Session(adapter: sessionAdapter).response(for: request)
    }
}
