//
//  startGame.swift
//  Challenge 2
//
//  Created by Ethan Soh on 16/8/25.
//

import SwiftUI
import MapKit
struct startGame: View {
    
    @Namespace private var animation
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
            
            
            
            
            
            VStack {
                HStack{
                    if tapped {
                        Spacer()
                        Image("Image 1")
                            .resizable()
                            .matchedGeometryEffect(id: "Image 1", in: animation)
                            .frame(width: 400, height: 450)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    tapped.toggle()
                                }
                            }
                    } else {
                        Image("Image 1")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .matchedGeometryEffect(id: "Image 1", in: animation)
                            .frame(width: 150, height: 200)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    tapped.toggle()
                                }
                                
                            }
                        Spacer()
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



#Preview {
    startGame()
}
