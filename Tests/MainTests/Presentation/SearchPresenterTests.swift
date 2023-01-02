//
//  SearchPresenterTests.swift
//  
//
//  Created by AkkeyLab on 2023/01/02.
//

import XCTest
@testable import Domain
@testable import Presentation

final class SearchPresenterTests: XCTestCase {
    var useCase: SearchCorporateUseCaseProtocol!

    override func setUp() {
        super.setUp()
        let gateway = SearchCorporateGatewayMock()
        useCase = SearchCorporateUseCaseMock(gateway: gateway)
    }

    func testSettingData() async throws {
        let expectation = expectation(description: "completed")
        let presenter = SearchPresenter(useCase: useCase)

        XCTAssertEqual(presenter.corporations, [])
        presenter.searchCorporate(name: "")

        await MainActor.run {
            expectation.fulfill()
        }

        await waitForExpectations(timeout: 1)
        let corporation = try XCTUnwrap(presenter.corporations.first)

        XCTAssertEqual(corporation.id, .zero)
        XCTAssertEqual(corporation.corporateNumber, "8011001150296")
        XCTAssertEqual(corporation.name, "ＡｋｋｅｙＬａｂ株式会社")
        XCTAssertEqual(corporation.prefectureName, "東京都")
        XCTAssertEqual(corporation.cityName, "渋谷区")
        XCTAssertEqual(corporation.streetNumber, "道玄坂１丁目１６－６二葉ビル８Ｂ")
        XCTAssertEqual(corporation.postCode, "1500043")
        XCTAssertEqual(corporation.furigana, "アッキーラボ")
    }
}
