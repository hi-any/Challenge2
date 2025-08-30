//
//  OnboardingView.swift
//  Challenge 2
//
//  Created by Yang Yihan on 23/8/25.
//

import SwiftUI

struct OnBoardingView: View {
    @Binding var showOnboarding: Bool
    var fruits: [Fruit] = fruitsData

    
    var body: some View {
      TabView {
        ForEach(fruits[0...6]) { item in
            CardView(fruit: item, showOnboarding: $showOnboarding)
        } //: LOOP
      } //: TAB
      .tabViewStyle(PageTabViewStyle())
      .padding(.vertical, 20)
    }

}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(showOnboarding: .constant(true))
    }
}
