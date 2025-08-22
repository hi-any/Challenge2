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
        VStack {
            Text("Instructions")
                .font(.headline)
                .padding()
            
            Text("1) \n2) \n3) ")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
