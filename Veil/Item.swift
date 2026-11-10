//
//  Item.swift
//  Veil
//
//  Created by Bennett Ferguson on 2026-11-10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
