//
//  SearchCorporateUseCaseTests.swift
//  
//
//  Created by AkkeyLab on 2023/01/02.
//

import XCTest
@testable import Domain

final class SearchCorporateUseCaseTests: XCTestCase {
    var gateway: SearchCorporateGatewayProtocol!

    override func setUp() {
        super.setUp()
        gateway = SearchCorporateGatewayMock()
    }

    func testConvertedEntityToModel() async throws {
        let useCase = SearchCorporateUseCase(gateway: gateway)

        let corporationsEntity = try await gateway.search(name: "")
        let corporationEntity = try XCTUnwrap(corporationsEntity.corporation.first)

        let result = try await useCase.search(name: "")
        let corporation = try XCTUnwrap(result.first)

        XCTAssertEqual(corporation.id, .zero)
        XCTAssertEqual(corporationEntity.corporateNumber, corporation.corporateNumber)
        XCTAssertEqual(corporationEntity.name, corporation.name)
        XCTAssertEqual(corporationEntity.prefectureName, corporation.prefectureName)
        XCTAssertEqual(corporationEntity.cityName, corporation.cityName)
        XCTAssertEqual(corporationEntity.streetNumber, corporation.streetNumber)
        XCTAssertEqual(corporationEntity.postCode, corporation.postCode)
        XCTAssertEqual(corporationEntity.furigana, corporation.furigana)
    }
}
