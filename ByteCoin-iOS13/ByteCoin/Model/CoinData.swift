//
//  CoinData.swift
//  ByteCoin
//
//  Created by Artur KNOTHE on 22/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
