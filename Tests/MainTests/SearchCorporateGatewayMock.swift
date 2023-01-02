//
//  SearchCorporateGatewayMock.swift
//  
//
//  Created by AkkeyLab on 2023/01/02.
//

import Data
import Domain
import XMLCoder

final class SearchCorporateGatewayMock: SearchCorporateGatewayProtocol {
    func search(name: String) async throws -> CorporationsEntity {
        typealias Entity = CorporationsEntity
        return try XMLDecoder().decode(Entity.self, from: Entity.data!)
    }
}
