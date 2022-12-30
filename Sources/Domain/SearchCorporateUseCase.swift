//
//  SearchCorporateUseCase.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

public protocol SearchCorporateUseCaseProtocol {
    func search(name: String) async throws -> [Corporation]
}

public final class SearchCorporateUseCase: SearchCorporateUseCaseProtocol {
    private let gateway: SearchCorporateGatewayProtocol

    public init(gateway: SearchCorporateGatewayProtocol) {
        self.gateway = gateway
    }

    public func search(name: String) async throws -> [Corporation] {
        do {
            let result = try await gateway.search(name: name)
            return result.corporation.map(Corporation.init)
        } catch {
            throw error
        }
    }
}
