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
    @State private var showPopup = false
    let locationManager = CLLocationManager()
    let cameraPosition: MapCameraPosition = .region(.init(center:.init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1300, longitudinalMeters: 1300))
    @State private var showingAlert = false
    var formattedTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    var body: some View {
        
        ZStack{
            Map(initialPosition: cameraPosition){
                Marker("Apple Vistor Center", systemImage: "tree.fill", coordinate: .appleHQ)
                UserAnnotation()
            }
            
            .onAppear{
                locationManager.requestWhenInUseAuthorization()
            }
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
                    Button {
                        showingAlert = true
                    } label: {
                        ZStack{
                            Circle()
                                .fill(Color.black)
                                .opacity(0.4)
                                .frame(width: 85, height: 85)
                            
                            Image(systemName: "lightbulb.max")
                                .foregroundColor(.yellow)
                                .font(.system(size: 50))
                        }
                    }
                    .offset(x: -15, y: -70)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Hints"), message: Text("The <__> line"), dismissButton: .default(Text("Got it!")))
                    }
                    //                    Button{
                    //                        withAnimation{
                    //
                    //                            showPopup = true
                    //                        }
                    //                    } label: {
                    //                        ZStack{
                    //                            Circle()
                    //                                .fill(Color.white)
                    //                                .opacity(0.4)
                    //                                .frame(width: 100, height: 100)
                    //
                    //                            Image(systemName: "lightbulb.max")
                    //                                .foregroundColor(.yellow)
                    //                                .font(.system(size: 50))
                    //                        }
                    //                    }
                    //                    .offset(x: -15, y: -70)
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
        if showPopup {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .transition(.opacity)
                .zIndex(1)
            
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
            .zIndex(2)
        }
    }
}



#Preview {
    startGame()
}
extension CLLocationCoordinate2D{
    static let appleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
}

