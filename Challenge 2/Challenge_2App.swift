//
//  Challenge_2App.swift
//  Challenge 2
//
//  Created by Yang Yihan on 16/8/25.
//

import SwiftUI

@main
struct Challenge_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct OnBoardingViewSwiftUIApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
              OnBoardingView()
            } else {
              HomeView()
            }
        }
    }
}
