//
//  ACLSApp.swift
//  Shared
//
//  Created by William Entriken on 2021-04-07.
//

import SwiftUI

@main
struct ACLSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                PrimaryView()
                    .navigationTitle("ACLS Algorithms")
                DetailView()
            }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
