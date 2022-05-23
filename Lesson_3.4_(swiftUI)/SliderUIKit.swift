//
//  SliderUIKit.swift
//  Lesson_3.4_(swiftUI)
//
//  Created by Евгения Шевцова on 23.05.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {

    @Binding var value: Double
    
    let opacity: Int
    let thumbColor: UIColor
    
    func makeUIView(context: Context) -> UISlider {
            let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeSliderValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = thumbColor
            .withAlphaComponent(CGFloat(opacity)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didChangeSliderValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
