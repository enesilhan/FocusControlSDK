//
//  ContentView.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import SwiftUI

public struct ContentView: View {
    @StateObject private var viewModel = FocusViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Button("Odak Başlat") {
                viewModel.startFocus(restrictedApps: ["Twitter"])
            }
        }
        .fullScreenCover(isPresented: $viewModel.showWarning) {
            FocusWarningView(
                onContinue: { viewModel.showWarning = false },
                onInterrupt: {
                    viewModel.showWarning = false
                    viewModel.focusManager.interruptFocus()
                }
            )
        }
    }
}
