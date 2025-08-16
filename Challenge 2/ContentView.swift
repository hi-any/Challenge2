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
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.gray)
                            .frame(width: 170, height: 60)
                        Text("Geoguess!")
                            .foregroundStyle(.black)
                            .padding()
                    }
                }
                Button{
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.yellow)
                            .frame(width: 170, height: 60)
                        Text("Go to Location...")
                            .foregroundStyle(.black)
                            .padding()
                    }
                }
            }
            
        }
    }
}
#Preview {
    ContentView()
}
