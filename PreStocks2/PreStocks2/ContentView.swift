//
//  ContentView.swift
//  PreStocks2
//
//  Created by Jeremy Chang on 09/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var selection = 0


    var body: some View {
        
        TabView(selection: $selection) {
            TodayView()
                .tabItem{
                    Label("Today", systemImage: "doc.text.image")
                }
            TrendsView()
                .tabItem{
                    Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                }
            TrendsView()
                .tabItem{
                    Label("News", systemImage: "newspaper")
                }
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
