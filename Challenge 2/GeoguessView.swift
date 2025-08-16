//
//  GeoguessView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//
import SwiftUI
struct GeoguessView: View {
    var body: some View {
        NavigationStack { // Or NavigationView in older SwiftUI
            VStack {
                Text("Welcome!")
                NavigationLink(destination: GeoguessView()) {
                    Text("Go to Detail View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Home")
        }
    }
}

//struct GeoguessView: View {
//    var body: some View {
//        Text("This is the Detail View!")
//            .navigationTitle("Detail")
//    }
//}
