//
//  ContentView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State private var showPopup = false
    var body: some View {
        ZStack{
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
                    } label: {
                        NavigationLink(destination: startGame()) {
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        showPopup = true
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
            if showPopup {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Instructions")
                            .font(.headline)
                            .padding()
                        Spacer()
                        Button(action: {
                            showPopup = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    InstructionsView()
                }
                .frame(width: 300)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .transition(.scale)
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showPopup)
    }
}

#Preview {
    ContentView()
}
