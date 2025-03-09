//
//  FocusDelegate.swift
//  
//
//  Created by Enes İlhan on 10.03.2025.
//

import Foundation

public protocol FocusDelegate: AnyObject {
    func focusDidComplete()
    func focusDidInterrupt()
}
