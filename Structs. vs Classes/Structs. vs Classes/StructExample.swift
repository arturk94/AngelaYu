//
//  StructExample.swift
//  Structs. vs Classes
//
//  Created by Artur KNOTHE on 17/11/2020.
//

import Foundation

struct Structhero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

