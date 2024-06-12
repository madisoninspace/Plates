//
//  ContentView.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("12345")
                .tabItem { Label("Plates", systemImage: "car") }
            
            BaseListView()
                .tabItem { Label("Bases", systemImage: "b.square") }
        }
    }
}

#Preview {
    ContentView()
}
