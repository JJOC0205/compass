//
//  ContentView.swift
//  compass
//
//  Created by Jonathon O'CONNELL on 5/27/26.
//

import SwiftUI
import SwiftData

struct Marker: Hashable{
    let degrees: Double
    let label: String
    
    init(degrees: Double, label: String = ""){
        self.degrees = degrees
        self.label = label
    }
    
    static func markers() -> [Marker] {
        return [
            Marker(degrees: 0, label: "N"),
            Marker(degrees: 30),
            Marker(degrees: 60),
            Marker(degrees: 90, label: "E"),
            Marker(degrees: 150),
            Marker(degrees: 180, label: "S"),
            Marker(degrees: 210),
            Marker(degrees: 240),
            Marker(degrees: 270, label: "W"),
            Marker(degrees: 300),
            Marker(degrees: 330)
        ]
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 5, height: 50)
            
            // 1
            ZStack{
                //2
                ForEach([0,30,60,90,120,150,180,210,240,270,300,330], id: \.self) { marker in // TODO
                }
            }.frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: 0))
                .statusBar(hidden: true)
        }
    }
    /*
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
     
     */
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
