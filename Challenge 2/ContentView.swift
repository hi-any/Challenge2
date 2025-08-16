//
//  ContentView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//

import SwiftUI
import MapKit
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Today's location is...")
                .font(.system(size: 30))
            Map()
                .mapStyle(.hybrid(elevation: .realistic))
                .padding()
            HStack{
                Button{
                } label:{
                    Text("Geoguess!")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 4)
                            )
                }
                Button{
                } label: {
                    Text("Go to Location...")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.yellow, lineWidth: 4)
                )
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
