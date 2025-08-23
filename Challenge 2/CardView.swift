//
//  OnboardingPageView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 23/8/25.
//
import SwiftUI

struct CardView: View {
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    var body: some View {
      ZStack {
        VStack(spacing: 20) {
          Image(fruit.image)
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .scaleEffect(isAnimating ? 1.0 : 0.6)
          
          Text(fruit.title)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          
          Text(fruit.headline)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(maxWidth: 480)
          
          // BUTTON: START
          StartButtonView()
        } //: VSTACK
      } //: ZSTACK
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimating = true
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(LinearGradient(gradient: Gradient(colors: fruit.Colors), startPoint: .top, endPoint: .bottom))
      .cornerRadius(20)
      .padding(.horizontal, 20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(fruit: fruitsData[0])
    }
}
