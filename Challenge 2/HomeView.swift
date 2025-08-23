//
//  HomeView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//
import SwiftUI
import MapKit

struct HomeView : View {
    var body: some View{
        VStack{
            Map()
                .mapStyle(.hybrid(elevation: .realistic))
                .padding()
            Button{
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.yellow)
                        .frame(width: 350, height: 60)
                        .opacity(0.7)
                    Text("Quests Completed")
                        .foregroundStyle(.black)
                        .padding()
                }
            }
            Button{
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.yellow)
                        .stroke(Color(red: 0.5, green: 0.7, blue: 0.9), lineWidth: 5)
                        .frame(width: 350, height: 60)
                        .opacity(0.4)
                    Text("Daily Puzzle")
                        .foregroundStyle(.black)
                        .padding()
                }
            }

        }
    }
}

#Preview {
    HomeView()
}
