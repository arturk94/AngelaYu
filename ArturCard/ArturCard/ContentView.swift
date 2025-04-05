//
//  ContentView.swift
//  ArturCard
//
//  Created by Artur KNOTHE on 01/05/2020.
//  Copyright © 2020 Artur KNOTHE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity:1.0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Artur")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Artur Knothe")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+33 6 52 73 48 84", imageName: "phone.fill")
                InfoView(text: "artur@knothe.org", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
    }
}
