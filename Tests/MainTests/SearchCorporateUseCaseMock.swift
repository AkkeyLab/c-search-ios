//
//  SearchCorporateUseCaseMock.swift
//  
//
//  Created by AkkeyLab on 2023/01/02.
//

@testable import Domain

final class SearchCorporateUseCaseMock: SearchCorporateUseCaseProtocol {
    private let gateway: SearchCorporateGatewayProtocol

    public init(gateway: SearchCorporateGatewayProtocol) {
        self.gateway = gateway
    }

    func search(name: String) async throws -> [Corporation] {
        let entity = try await gateway.search(name: "")
        return entity.corporation.enumerated().map(Corporation.init)
    }
}
