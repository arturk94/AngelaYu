//
//  PostData.swift
//  H4XOR News
//
//  Created by Artur KNOTHE on 01/05/2020.
//  Copyright © 2020 Artur KNOTHE. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
