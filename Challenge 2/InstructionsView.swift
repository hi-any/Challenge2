//
//  InstructionsView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 22/8/25.
//
import SwiftUI

struct InstructionsView: View {
    @State private var showPopup = false
    var body: some View {
        VStack (alignment: .leading) {
            Text("Instructions")
                .font(.headline)
            Text("1)Find location \n2)Choose to Geoguess or go to location ")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
