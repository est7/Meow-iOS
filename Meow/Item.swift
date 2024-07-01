//
//  Item.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/1.
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
