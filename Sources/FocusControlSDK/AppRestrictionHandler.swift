//
//  AppRestrictionHandler.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation
import UIKit

public class AppRestrictionHandler: RestrictionHandling {
    private var onSwitch: (() -> Void)?
    
    public init() {}
    
    public func monitorAppSwitch(restrictedApps: [String], onSwitch: @escaping () -> Void) {
        self.onSwitch = onSwitch
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidSwitch),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
    }
    
    public func stopMonitoring() {
        NotificationCenter.default.removeObserver(self)
        onSwitch = nil
    }
    
    @objc private func appDidSwitch() {
        onSwitch?()
    }
}
