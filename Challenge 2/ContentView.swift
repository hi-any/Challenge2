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
        NavigationStack{
            VStack {
                Text("Today's location is...")
                    .font(.system(size: 30))
                    .offset(x: -55, y: 30)
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
                                .opacity(0.8)
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
                                .opacity(0.8)
                            Text("Go to Location...")
                                .foregroundStyle(.black)
                                .padding()
                        }
                    }
                }
                Button{
                } label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.green)
                            .frame(width: 350, height: 60)
                            .opacity(0.8)
                        Text("Start!")
                            .foregroundStyle(.black)
                            .padding()
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                    } label: {
                        Text("  ?")
                            .font(.system(size: 25))
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                    } label: {
                        Text("Close")
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
