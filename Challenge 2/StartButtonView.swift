//
//  StartButtonView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 23/8/25.
//
import SwiftUI

struct StartButtonView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var body: some View {
        Button(action: {
            isOnboarding = false
        }) {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.black, lineWidth: 1.25)
            )
        }
        .accentColor(Color.black)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}
