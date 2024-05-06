//
//  StateBinding.swift
//  SwiftUIExample
//
//  Created by Yago Pereira on 4/5/24.
//

import SwiftUI

struct StateBindingView: View {
    @State private var volume: Int = 50

    var body: some View {
        VStack {
            Text("Volume Atual: \(volume)")
                .font(.title)
            VolumeAdjuster(volume: $volume)
        }
    }
}

struct VolumeAdjuster: View {
    @Binding var volume: Int

    var body: some View {
        Slider(value: Binding(get: {
            Double(volume)
        }, set: { newVolume in
            volume = Int(newVolume)
        }), in: 0...100)
        .padding()
    }
}
