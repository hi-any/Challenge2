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
    var formattedTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    var body: some View {
        ZStack{
            NavigationStack{
                VStack {
                    Text("Today's location is Apple HQ")
                        .font(.system(size: 30))
                        .offset(x: -2, y: 30)
                    Map()
                        .mapStyle(.hybrid(elevation: .realistic))
                        .padding()
                    Text("Congrats! You reached the location!")
                        .font(.system(size: 23))
                        .offset(x: 0, y: -15)
                        .padding()
                    Spacer()
                    Text("Time taken: \(formattedTime)")
                        .font(.system(size: 23))
                        .offset(x: -90, y: -15)
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
    EndGameView(elapsedTime: 30)
}
