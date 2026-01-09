//
//  SnackListView.swift
//  ESSI
//
//  Created by app-kaihatsusha on 09/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct SnackListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var snacks: [Snack]
    
    var body: some View {
        NavigationStack {
            List(snacks) { snack in
                VStack(alignment: .leading) {
                    Text(snack.name)
                        .font(.title)
                        .lineLimit(1)
                    HStack {
                        Text("Qty: \(snack.onHand)")
                        Text(snack.notes)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                            .italic()
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Snacks on Hand:")
        }
        
    }
}

#Preview {
    SnackListView()
    //.modelContainer(for: Snack.self, inMemory: true)
        .modelContainer(Snack.preview)
}
