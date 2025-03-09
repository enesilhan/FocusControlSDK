//
//  RestrictionHandling.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation

public protocol RestrictionHandling {
    func monitorAppSwitch(restrictedApps: [String], onSwitch: @escaping () -> Void)
    func stopMonitoring()
}
