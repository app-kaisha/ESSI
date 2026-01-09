//
//  Snack.swift
//  ESSI
//
//  Created by app-kaihatsusha on 09/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Snack {
    var name: String = ""
    var onHand: Int = 0
    var notes: String = ""
    var comfortLevel: Int = 1
    
    init(name: String, onHand: Int, notes: String, comfortLevel: Int) {
        self.name = name
        self.onHand = onHand
        self.notes = notes
        self.comfortLevel = comfortLevel
    }
    
    convenience init() {
        self.init(name: "", onHand: 0, notes: "", comfortLevel: 1)
    }
}

extension Snack {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Snack.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Snack(name: "Cheddar Goldfish", onHand: 3, notes: "Best eaten by the handful while doomscrolling.", comfortLevel: 1))
        container.mainContext.insert(Snack(name: "Spicy Takis", onHand: 1, notes: "Left lips numb last time. No regrets.", comfortLevel: 2))
        container.mainContext.insert(Snack(name: "Frozen Thin Mints", onHand: 3, notes: "A classy cold snack. Seasonal, like depression.", comfortLevel: 3))
        container.mainContext.insert(Snack(name: "Trader Joe’s Scandinavian Swimmers", onHand: 2, notes: "Pretends to be healthy. Not fooling anyone.", comfortLevel: 3))
        container.mainContext.insert(Snack(name: "Mom's Cookies", onHand: 1, notes: "Nothing better. Like a warm blanket", comfortLevel: 5))
        
        
        return container
    }
    
}
