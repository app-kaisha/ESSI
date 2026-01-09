//
//  SnackDetailView.swift
//  ESSI
//
//  Created by app-kaihatsusha on 09/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct SnackDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var onHand = 0
    @State private var notes = ""
    @State private var comfortLevel = 1
    
    @State var snack: Snack
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("snack name", text: $name)
                .font(.largeTitle)
                .textFieldStyle(.roundedBorder)
            HStack {
                Text("Qty:")
                    .bold()
                Spacer()
                Text("\(onHand)")
//                Stepper("") {
//                    onHand = onHand<Int.max ? onHand+1 : Int.max
//                } onDecrement: {
//                    onHand = onHand>0 ? onHand-1 : 0
//                }
                Stepper("", value: $onHand, in: 0...Int.max)
                .labelsHidden()
            }
            .font(.title2)
            .padding(.bottom)
            
            Text("Notes:")
                .font(.title2).bold()
            TextField("Notes", text: $notes, axis: .vertical)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal)
        .onAppear {
            name = snack.name
            onHand = snack.onHand
            notes = snack.notes
            comfortLevel = snack.comfortLevel
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    snack.name = name
                    snack.onHand = onHand
                    snack.notes = notes
                    snack.comfortLevel = comfortLevel
                    
                    modelContext.insert(snack)
                    
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save on DetailView did not work.")
                        return
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SnackDetailView(snack: Snack(name: "Lil Swifties", onHand: 3, notes: "Homemade cookies baked in class and will appear in the new year.", comfortLevel: 5))
            .modelContainer(Snack.preview)
    }
}
