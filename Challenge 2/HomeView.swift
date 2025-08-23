//
//  HomeView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//
import SwiftUI
import MapKit

struct HomeView : View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var body: some View{
        NavigationStack{
            VStack{
                Map()
                    .mapStyle(.hybrid(elevation: .realistic))
                    .padding()
                Button{
                } label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.yellow)
                            .stroke(Color(red: 0.5, green: 0.7, blue: 0.9), lineWidth: 5)
                            .frame(width: 350, height: 60)
                            .opacity(0.4)
                        Text("Quests Completed")
                            .foregroundStyle(.black)
                            .padding()
                    }
                }
                Button{
                } label:{
                    NavigationLink(destination: ContentView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.yellow)
                                .stroke(Color(red: 0.5, green: 0.7, blue: 0.9), lineWidth: 5)
                                .frame(width: 350, height: 60)
                                .opacity(0.5)
                            Text("Daily Puzzle")
                                .foregroundStyle(.black)
                                .padding()
                        }
                    }
                }
                Button(action: {
                    isOnboarding = true
                }) {
                    HStack(spacing: 8) {
                        Text("Re-Start")
                        
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Capsule().strokeBorder(Color.black, lineWidth: 1.25)
                    )
                } //: BUTTON
                .accentColor(Color.black)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
