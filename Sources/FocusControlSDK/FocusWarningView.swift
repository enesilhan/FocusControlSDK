//
//  FocusWarningView.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import SwiftUI

public struct FocusWarningView: View {
    let onContinue: () -> Void
    let onInterrupt: () -> Void
    
    public init(onContinue: @escaping () -> Void, onInterrupt: @escaping () -> Void) {
        self.onContinue = onContinue
        self.onInterrupt = onInterrupt
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.8).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Ağacın Soluyor!")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Odak moduna geri dön, yoksa ağacın ölecek!")
                    .foregroundColor(.white)
                HStack(spacing: 20) {
                    Button("Geri Dön") {
                        onContinue()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Vazgeç") {
                        onInterrupt()
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                }
            }
            .padding()
        }
    }
}
