//
//  content view.swift
//  Challenge 2
//
//  Created by Yang Yihan on 8/9/25.
//

import SwiftUI

struct contentview : View {
    @State private var userAnswer: String = ""
    @State private var resultText: String = ""
    
    let correctAnswer = "apple hq"

    var body: some View {
        VStack(spacing: 20) {
            Text("Where is Apple located?")
                .font(.headline)

            TextField("Enter your answer", text: $userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none) // optional: prevents capitalizing input
                .disableAutocorrection(true)

            Button("Submit") {
                checkAnswer()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Text(resultText)
                .font(.title2)
                .foregroundColor(resultText == "🎉 Yayyy!" ? .green : .red)
        }
        .padding()
    }
    
    func checkAnswer() {
        let cleanedAnswer = userAnswer
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        
        if cleanedAnswer == correctAnswer {
            resultText = "🎉 Yayyy!"
        } else {
            resultText = "❌ Nah"
        }
    }
}

#Preview {
    ContentView()
}
