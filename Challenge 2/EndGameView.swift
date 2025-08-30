//
//  EndGameView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 30/8/25.
//

import SwiftUI
import MapKit
struct EndGameView: View {
    var elapsedTime: Int
    var body: some View {
        ZStack{
            NavigationStack{
                VStack {
                    Text("Today's location is <__>")
                        .font(.system(size: 30))
                        .offset(x: -33, y: 30)
                    Map()
                        .mapStyle(.hybrid(elevation: .realistic))
                        .padding()
                    Text("Congrats! You reached the location!")
                        .font(.system(size: 23))
                        .offset(x: 0, y: -15)
                        .padding()
                    Spacer()
                    Text("Time taken: \(elapsedTime)")
                        .font(.system(size: 23))
                        .offset(x: -103, y: -15)
                    Text("Hints used: ")
                        .font(.system(size: 23))
                        .offset(x: -114, y: -15)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: HomeView()) {
                            Text("Close")
                                .font(.system(size: 20))
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}


#Preview {
    EndGameView(elapsedTime: 10)
}
