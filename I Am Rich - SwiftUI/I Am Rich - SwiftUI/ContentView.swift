//
//  ContentView.swift
//  I Am Rich - SwiftUI
//
//  Created by Artur KNOTHE on 01/05/2020.
//  Copyright © 2020 Artur KNOTHE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
    }
}



/*
 PreviewDevice rawValues
"Mac"
"iPhone 7"
"iPhone 7 Plus"
"iPhone 8"
"iPhone 8 Plus"
"iPhone SE"
"iPhone X"
"iPhone Xs"
"iPhone Xs Max"
"iPhone Xʀ"
"iPad mini 4"
"iPad Air 2"
"iPad Pro (9.7-inch)"
"iPad Pro (12.9-inch)"
"iPad (5th generation)"
"iPad Pro (12.9-inch) (2nd generation)"
"iPad Pro (10.5-inch)"
"iPad (6th generation)"
"iPad Pro (11-inch)"
"iPad Pro (12.9-inch) (3rd generation)"
"iPad mini (5th generation)"
"iPad Air (3rd generation)"
"Apple TV"
"Apple TV 4K"
"Apple TV 4K (at 1080p)"
"Apple Watch Series 2 - 38mm"
"Apple Watch Series 2 - 42mm"
"Apple Watch Series 3 - 38mm"
"Apple Watch Series 3 - 42mm"
"Apple Watch Series 4 - 40mm"
"Apple Watch Series 4 - 44mm"
*/
