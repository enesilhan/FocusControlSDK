//
//  FocusManager.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation
import UIKit

public class FocusManager {
    private let duration: Int
    private let restrictionHandler: RestrictionHandling
    private weak var delegate: FocusDelegate?
    private var timer: Timer?
    private var isActive = false
    
    public init(duration: Int, restrictionHandler: RestrictionHandling, delegate: FocusDelegate?) {
        self.duration = duration
        self.restrictionHandler = restrictionHandler
        self.delegate = delegate
    }
    
    public func startFocus(restrictedApps: [String]) {
        guard !isActive else { return }
        isActive = true

        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(duration * 60), repeats: false) { [weak self] _ in
            self?.endFocus(completed: true)
        }

        restrictionHandler.monitorAppSwitch(restrictedApps: restrictedApps) { [weak self] in
            self?.showWarning()
        }
    }
    
    private func showWarning() {
        NotificationCenter.default.post(name: .showFocusWarning, object: nil)
    }
    
    public func interruptFocus() {
        endFocus(completed: false)
    }
    
    private func endFocus(completed: Bool) {
        guard isActive else { return }
        isActive = false
        timer?.invalidate()
        restrictionHandler.stopMonitoring()
        if completed {
            delegate?.focusDidComplete()
        } else {
            delegate?.focusDidInterrupt()
        }
    }
}
