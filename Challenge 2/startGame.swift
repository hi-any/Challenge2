//
//  startGame.swift
//  Challenge 2
//
//  Created by Ethan Soh on 16/8/25.
//

import SwiftUI
import MapKit
struct startGame: View {
    
    
    @State private var imageScale: CGFloat = 1.0
    @State private var currentDate = Date.now
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer? = nil
    @State var tapped = false
    @State var imageLocationX: CGFloat = 1
    @State var imageLocationY: CGFloat = 1
    var formattedTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)

    }
    
    var body: some View {
        
        ZStack{
            Map()
                .mapStyle(.hybrid(elevation: .realistic))
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Image("Image 1")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .scaleEffect(imageScale)
                        .padding()
                        .frame(width: 200, height: 250)
                        .onTapGesture {
                            
                            let tapped = true
                            withAnimation(.easeInOut(duration: 0.5)) {
                                imageScale = (imageScale == 1.0) ? 3 : 1.0
                                    
                                if tapped == false{
                                   
                                    
                                    
                                }
                            }
                            
                        }
                    VStack{
                        Spacer()
                        Text("Time: \(formattedTime)")
                            .bold()
                            .monospaced()
                            .font(.largeTitle)
                            .padding(7)
                            .background(Color(red:12 , green:12 , blue: 12))
                            .clipShape(RoundedRectangle (cornerRadius: 10))
                            .padding()
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
        }
    }
}
#Preview {
    startGame()
}
