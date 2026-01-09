//
//  ContentView.swift
//  ESSI
//
//  Created by app-kaihatsusha on 09/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var snack: [Snack]
    
    var body: some View {
        VStack {
            Text("\(snack.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        //.modelContainer(for: Snack.self, inMemory: true)
        .modelContainer(Snack.preview)
}
