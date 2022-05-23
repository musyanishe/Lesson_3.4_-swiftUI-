//
//  ContentView.swift
//  Lesson_3.4_(swiftUI)
//
//  Created by Евгения Шевцова on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 20.0
    @State private var targetValue = Int.random(in: 1...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack{
                Text("0")
                SliderUIKit(
                    value: $currentValue,
                    opacity: computeScore(),
                    thumbColor: .red
                )
                Text("100")
            }.padding()
            
            
            CheckButton(
                targetValue: $targetValue,
                currentValue: $currentValue,
                showAlert: $showAlert,
                score: computeScore()
            )
            .foregroundColor(.green)
        }
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CheckButton: View {
    @Binding var targetValue: Int
    @Binding var currentValue: Double
    @Binding var showAlert: Bool
    let score: Int
    
    var body: some View {
        Button("Проверить!") { showAlert = true }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Ваш счет"),
                    message: Text("\(score)"),
                    dismissButton:
                            .default(Text("Начать заново!")) {
                                targetValue = Int.random(in: 1...100)
                            }
                )
            }
    }
}

