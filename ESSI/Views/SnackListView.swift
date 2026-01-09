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
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List(snacks) { snack in
                NavigationLink {
                    SnackDetailView(snack: snack)
                } label: {
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
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        modelContext.delete(snack)
                        
                        guard let _ = try? modelContext.save() else {
                            print("😡 ERROR: Delete on ListView did not work.")
                            return
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Snacks on Hand:")
            .sheet(isPresented: $showSheet) {
                NavigationStack {
                    SnackDetailView(snack: Snack())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        SnackListView()
        //.modelContainer(for: Snack.self, inMemory: true)
            .modelContainer(Snack.preview)
    }
}
