//
//  FocusViewModel.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation
import SwiftUI

public class FocusViewModel: ObservableObject, FocusDelegate {
    @Published public var showWarning = false
    public let focusManager: FocusManager
    
    public init(duration: Int = 25) {
        let restrictionHandler = AppRestrictionHandler()
        self.focusManager = FocusManager(duration: duration, restrictionHandler: restrictionHandler, delegate: self)
    }
    
    public func startFocus(restrictedApps: [String]) {
        focusManager.startFocus(restrictedApps: restrictedApps)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(triggerWarning),
            name: .showFocusWarning,
            object: nil
        )
    }
    
    public func focusDidComplete() {
        print("Odak tamamlandı: 20 coin!")
    }
    
    public func focusDidInterrupt() {
        print("Odak bozuldu!")
    }
    
    @objc private func triggerWarning() {
        DispatchQueue.main.async {
            self.showWarning = true
        }
    }
}
