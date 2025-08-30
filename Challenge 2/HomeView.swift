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
                Button{
                } label:{
                    Image(systemName: "person.crop.circle.fill")
                        .padding(EdgeInsets(top: 0, leading: -190, bottom: -10, trailing: 0))
                        .font(.system(size: 40))
                }
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
                }
                .accentColor(Color.black)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
