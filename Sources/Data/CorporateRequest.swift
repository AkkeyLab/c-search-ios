//
//  CorporateRequest.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import APIKit
import Foundation

struct CorporateRequest: Request {
    typealias Response = Corporations

    // https://www.houjin-bangou.nta.go.jp/documents/k-web-api-kinou-gaiyo.pdf#page=24
    var baseURL: URL {
        URL(string: "https://api.houjin-bangou.nta.go.jp")!
    }

    var method: APIKit.HTTPMethod {
        .get
    }

    var path: String {
        "/4/name"
    }

    var queryParameters: [String : Any]? {
        [
            "id": apiKey,
            "name": name,
            "type": type.rawValue,
            "mode": mode.rawValue,
            "kind": kind.rawValue,
            "close": hasClosed ? 1 : Int.zero
        ]
    }

    var dataParser: DataParser {
        XmlDataParser<Response>()
    }

    private let apiKey: String
    private let name: String
    private let type: CorporateResponseType
    private let mode: CorporateSearchMode
    private let kind: CorporateKind
    private let hasClosed: Bool

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let response = object as? Response else {
            throw RequestError.responseNotFound
        }
        return response
    }
}
