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
            "type": "12",
            "mode": "2",
            "kind": "03",
            "close": "0"
        ]
    }

    var dataParser: DataParser {
        XmlDataParser<Response>()
    }

    private let apiKey: String
    private let name: String

    init(apiKey: String, name: String) {
        self.apiKey = apiKey
        self.name = name
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let response = object as? Response else {
            throw RequestError.responseNotFound
        }
        return response
    }
}
