//
//  AppRestrictionHandler.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation
import SwiftUI

public class AppRestrictionHandler: RestrictionHandling {
    private var onSwitch: (() -> Void)?
    
    public init() {}
    
    public func monitorAppSwitch(restrictedApps: [String], onSwitch: @escaping () -> Void) {
        self.onSwitch = onSwitch
        
        #if os(iOS) || targetEnvironment(macCatalyst)
        // Yalnızca iOS (ve macCatalyst) tarafında kullanılabilen UIApplication API'si
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidSwitch),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        #elseif os(macOS)
        // macOS tarafında farklı bir yaklaşım kullanabilirsiniz (örnek: NSApplication, NSWorkspace notifications)
        // Şimdilik no-op (boş) bırakalım
        #elseif os(watchOS)
        // watchOS tarafında UIApplication yok, watchOS'ta no-op
        #endif
    }
    
    #if os(iOS) || targetEnvironment(macCatalyst)
    @objc private func appDidSwitch() {
        onSwitch?()
    }
    #endif
    
    public func stopMonitoring() {
        #if os(iOS) || targetEnvironment(macCatalyst)
        NotificationCenter.default.removeObserver(self)
        #endif
        onSwitch = nil
    }
}
