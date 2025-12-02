//
//  AppTabView.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

//
//  ContentView.swift
//  Reho Eats
//
//  Created by Rehan on 13/09/25.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var container: ServiceContainer

    var body: some View {
        TabView {
            SearchTab()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SettingsTab()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    AppTabView()
}
