//
//  Untitled.swift
//  Challenge 2
//
//  Created by Yang Yihan on 8/9/25.
//

import SwiftUI
import MapKit
import Foundation

struct GeoGuessView: View {
    @Namespace private var animation
    @State private var imageScale: CGFloat = 1.0
    @State private var currentDate = Date.now
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer? = nil
    @State private var userAnswer: String = ""
    @State private var resultText: String = ""
    @State var tapped = false
    @State var imageLocationX: CGFloat = 1
    @State var imageLocationY: CGFloat = 1
    @State private var navigateToEndGame = false
    let cameraPosition: MapCameraPosition = .region(.init(center:.init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1300, longitudinalMeters: 1300))
    let targetLocation = CLLocation(latitude: 37.3346, longitude: -122.0090)
    @State private var showingAlert = false
    let correctAnswer = "apple hq"
    var formattedTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Map(initialPosition: cameraPosition){
                    Marker("Apple Vistor Center", systemImage: "tree.fill", coordinate: .appleHQ)
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
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 200)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                                .padding()
                            VStack{
                                Text("What is the location called?")
                                    .font(.headline)
                                TextField("Enter your answer", text: $userAnswer)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .autocapitalization(.none) // optional: prevents capitalizing input
                                    .disableAutocorrection(true)
                                VStack {
                                    Button("Submit") {
                                        checkAnswer()
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .padding()
                                    .navigationDestination(isPresented: $navigateToEndGame) {
                                        EndGameView(elapsedTime: 0)
                                    }
                                    
                                    Text(resultText)
                                        .font(.title2)
                                        .foregroundColor(resultText == "" ? .red : .green)
                                }
                            }
                            .padding()
                            
                            
                        }
                    }
                    
                }
            }
        }
    }
    func checkAnswer() {
        let cleanedAnswer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if cleanedAnswer == correctAnswer {
            print("correct ans")
            navigateToEndGame = true
        } else {
            print("wrong answer")
            resultText = "Nah"
        }
    }
}


#Preview {
    GeoGuessView()
}
