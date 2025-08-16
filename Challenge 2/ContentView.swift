//
//  ContentView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//

import SwiftUI
import MapKit
struct ContentView: View {
    var body: some View {
        VStack {
            Text("hi")
            Map()
                .mapStyle(.hybrid(elevation: .realistic))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
