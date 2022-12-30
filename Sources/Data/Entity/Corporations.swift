//
//  Corporations.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

// https://www.houjin-bangou.nta.go.jp/documents/k-web-api-kinou-gaiyo.pdf#page=40
struct Corporations: Codable {
    let lastUpdateDate: Date
    let count: Int
    let divideNumber: Int
    let divideSize: Int
    let corporation: [Corporation]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lastUpdateDate = try container.decodeDate(forKey: .lastUpdateDate)
        self.count = try container.decode(Int.self, forKey: .count)
        self.divideNumber = try container.decode(Int.self, forKey: .divideNumber)
        self.divideSize = try container.decode(Int.self, forKey: .divideSize)
        self.corporation = try container.decode([Corporation].self, forKey: .corporation)
    }
}

struct Corporation: Codable {
    let sequenceNumber: Int
    let corporateNumber: String
    let process: String
    let correct: String?
    let updateDate: Date
    let changeDate: Date
    let name: String
    let nameImageId: String?
    let kind: String
    let prefectureName: String
    let cityName: String
    let streetNumber: String
    let addressImageId: String?
    let prefectureCode: String
    let cityCode: String
    let postCode: String
    let addressOutside: String?
    let addressOutsideImageId: String?
    let closeDate: Date?
    let closeCause: String?
    let successorCorporateNumber: String?
    let changeCause: String?
    let assignmentDate: Date
    let latest: String
    let enName: String?
    let enPrefectureName: String?
    let enCityName: String?
    let enAddressOutside: String?
    let furigana: String?
    let hihyoji: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sequenceNumber = try container.decode(Int.self, forKey: .sequenceNumber)
        self.corporateNumber = try container.decode(String.self, forKey: .corporateNumber)
        self.process = try container.decode(String.self, forKey: .process)
        self.correct = try container.decodeIfPresent(String.self, forKey: .correct)
        self.updateDate = try container.decodeDate(forKey: .updateDate)
        self.changeDate = try container.decodeDate(forKey: .changeDate)
        self.name = try container.decode(String.self, forKey: .name)
        self.nameImageId = try container.decodeIfPresent(String.self, forKey: .nameImageId)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.prefectureName = try container.decode(String.self, forKey: .prefectureName)
        self.cityName = try container.decode(String.self, forKey: .cityName)
        self.streetNumber = try container.decode(String.self, forKey: .streetNumber)
        self.addressImageId = try container.decodeIfPresent(String.self, forKey: .addressImageId)
        self.prefectureCode = try container.decode(String.self, forKey: .prefectureCode)
        self.cityCode = try container.decode(String.self, forKey: .cityCode)
        self.postCode = try container.decode(String.self, forKey: .postCode)
        self.addressOutside = try container.decodeIfPresent(String.self, forKey: .addressOutside)
        self.addressOutsideImageId = try container.decodeIfPresent(String.self, forKey: .addressOutsideImageId)
        self.closeDate = try container.decodeDateIfPresent(forKey: .closeDate)
        self.closeCause = try container.decodeIfPresent(String.self, forKey: .closeCause)
        self.successorCorporateNumber = try container.decodeIfPresent(String.self, forKey: .successorCorporateNumber)
        self.changeCause = try container.decodeIfPresent(String.self, forKey: .changeCause)
        self.assignmentDate = try container.decodeDate(forKey: .assignmentDate)
        self.latest = try container.decode(String.self, forKey: .latest)
        self.enName = try container.decodeIfPresent(String.self, forKey: .enName)
        self.enPrefectureName = try container.decodeIfPresent(String.self, forKey: .enPrefectureName)
        self.enCityName = try container.decodeIfPresent(String.self, forKey: .enCityName)
        self.enAddressOutside = try container.decodeIfPresent(String.self, forKey: .enAddressOutside)
        self.furigana = try container.decodeIfPresent(String.self, forKey: .furigana)
        self.hihyoji = try container.decodeIfPresent(String.self, forKey: .hihyoji)
    }
}
