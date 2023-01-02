//
//  CorporateRequestTests.swift
//  
//
//  Created by AkkeyLab on 2023/01/02.
//

import APIKit
import XCTest
@testable import Data

final class CorporateRequestTests: XCTestCase {
    var adapter: TestSessionAdapter!
    var session: Session!

    override func setUp() {
        super.setUp()
        adapter = TestSessionAdapter()
        session = Session(adapter: adapter)
    }

    func testRecentlyEstablishedCompany() async throws {
        let xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><corporations><lastUpdateDate>2022-12-28</lastUpdateDate><count>1</count><divideNumber>1</divideNumber><divideSize>1</divideSize><corporation><sequenceNumber>1</sequenceNumber><corporateNumber>8011001150296</corporateNumber><process>01</process><correct>0</correct><updateDate>2022-10-14</updateDate><changeDate>2022-10-14</changeDate><name>ＡｋｋｅｙＬａｂ株式会社</name><nameImageId/><kind>301</kind><prefectureName>東京都</prefectureName><cityName>渋谷区</cityName><streetNumber>道玄坂１丁目１６－６二葉ビル８Ｂ</streetNumber><addressImageId/><prefectureCode>13</prefectureCode><cityCode>113</cityCode><postCode>1500043</postCode><addressOutside/><addressOutsideImageId/><closeDate/><closeCause/><successorCorporateNumber/><changeCause/><assignmentDate>2022-10-14</assignmentDate><latest>1</latest><enName/><enPrefectureName/><enCityName/><enAddressOutside/><furigana>アッキーラボ</furigana><hihyoji>0</hihyoji></corporation></corporations>"

        adapter.data = try XCTUnwrap(xml.data(using: .utf8))

        let request = CorporateRequest(
            apiKey: "",
            name: "",
            type: .unicodeXML,
            mode: .partialMatch,
            kind: .normal,
            hasClosed: false
        )
        let result = try await session.response(for: request)
        XCTAssertEqual(result.lastUpdateDate.description, "2022-12-27 15:00:00 +0000")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.divideNumber, 1)
        XCTAssertEqual(result.divideSize, 1)
        let corporation = try XCTUnwrap(result.corporation.first)
        XCTAssertEqual(corporation.sequenceNumber, 1)
        XCTAssertEqual(corporation.corporateNumber, "8011001150296")
        XCTAssertEqual(corporation.process, "01")
        XCTAssertEqual(corporation.correct, "0")
        XCTAssertEqual(corporation.updateDate.description, "2022-10-13 15:00:00 +0000")
        XCTAssertEqual(corporation.changeDate.description, "2022-10-13 15:00:00 +0000")
        XCTAssertEqual(corporation.name, "ＡｋｋｅｙＬａｂ株式会社")
        XCTAssertNil(corporation.nameImageId)
        XCTAssertEqual(corporation.kind, "301")
        XCTAssertEqual(corporation.prefectureName, "東京都")
        XCTAssertEqual(corporation.cityName, "渋谷区")
        XCTAssertEqual(corporation.streetNumber, "道玄坂１丁目１６－６二葉ビル８Ｂ")
        XCTAssertNil(corporation.addressImageId)
        XCTAssertEqual(corporation.prefectureCode, "13")
        XCTAssertEqual(corporation.cityCode, "113")
        XCTAssertEqual(corporation.postCode, "1500043")
        XCTAssertNil(corporation.addressOutside)
        XCTAssertNil(corporation.addressOutsideImageId)
        XCTAssertNil(corporation.closeDate)
        XCTAssertNil(corporation.closeCause)
        XCTAssertNil(corporation.successorCorporateNumber)
        XCTAssertNil(corporation.changeCause)
        XCTAssertEqual(corporation.assignmentDate.description, "2022-10-13 15:00:00 +0000")
        XCTAssertEqual(corporation.latest, "1")
        XCTAssertNil(corporation.enName)
        XCTAssertNil(corporation.enPrefectureName)
        XCTAssertNil(corporation.enCityName)
        XCTAssertNil(corporation.enAddressOutside)
        XCTAssertEqual(corporation.furigana, "アッキーラボ")
        XCTAssertEqual(corporation.hihyoji, "0")
    }
}
