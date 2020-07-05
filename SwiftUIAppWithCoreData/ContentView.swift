//
//  ContentView.swift
//  SwiftUIAppWithCoreData
//
//  Created by Bartholomäus Maciag on 03.07.20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: SampleEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \SampleEntity.name, ascending: false)
        ]
    ) var entities: FetchedResults<SampleEntity>
    
    var body: some View {
        VStack {
            Text("Hello, world!").padding()
            
            Button(action: {
                let newEntry = SampleEntity(context: self.moc)
                newEntry.name = "New name"
                
                if self.moc.hasChanges {
                    try? self.moc.save()
                }
            }) {
                Text("Add entry")
            }
            
            List(entities, id: \.self) { entity in
                Text(entity.name ?? "Unknown")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
