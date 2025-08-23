//
//  OnboardingPageView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 23/8/25.
//
import SwiftUI

struct OnboardingPage: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}
struct OnboardingPageView: View {
       let page: OnboardingPage

       var body: some View {
           VStack {
               Image(page.imageName)
                   .resizable()
                   .scaledToFit()
                   .frame(height: 200)
               Text(page.title)
                   .font(.largeTitle)
                   .fontWeight(.bold)
               Text(page.description)
                   .font(.body)
                   .multilineTextAlignment(.center)
                   .padding()
           }
       }
   }

#Preview {
    OnboardingPageView(page: OnboardingPage(
        imageName: "example-image",
        title: "Hi",
        description: "Hi"
    ))
}
