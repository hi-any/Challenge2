//
//  startGame.swift
//  Challenge 2
//
//  Created by Ethan Soh on 16/8/25.
//

import SwiftUI
import MapKit
struct startGame: View {
    @State private var currentDate = Date.now
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer? = nil
    var formattedTime: String {
           let minutes = elapsedTime / 60
           let seconds = elapsedTime % 60
           return String(format: "%02d:%02d", minutes, seconds)
       }
       
    var body: some View {
        VStack{
            Text("Today's Location is...")
                .bold()
                .font(.largeTitle)
                .padding()
    
            Image("Image 1")
                .resizable()
                .padding()
            Text("Time: \(formattedTime)")
                .bold()
                .monospaced()
                .font(.largeTitle)
                .onAppear {
                    elapsedTime = 0
                    timer?.invalidate()
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        elapsedTime += 1
                    }
                    
                    
                }
            
            
        }
    }
}
    #Preview {
        startGame()
    }
