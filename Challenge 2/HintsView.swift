//
//  HintsView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 30/8/25.
//
import SwiftUI

struct HintsView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

#Preview {
    HintsView()
}

