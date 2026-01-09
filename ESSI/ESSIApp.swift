//
//  ESSIApp.swift
//  ESSI
//
//  Created by app-kaihatsusha on 09/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct ESSIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Snack.self)
        }
    }
}
