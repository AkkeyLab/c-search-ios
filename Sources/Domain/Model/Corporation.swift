//
//  Corporation.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import Data

public struct Corporation {
    public let id: Int
    public let corporateNumber: String
    public let name: String
    public let prefectureName: String
    public let cityName: String
    public let streetNumber: String
    public let postCode: String
    public let furigana: String?

    init(id: Int, entity: CorporationEntity) {
        self.id = id
        corporateNumber = entity.corporateNumber
        name = entity.name
        prefectureName = entity.prefectureName
        cityName = entity.cityName
        streetNumber = entity.streetNumber
        postCode = entity.postCode
        furigana = entity.furigana
    }
}

extension Corporation: Identifiable {}
extension Corporation: Hashable {}
