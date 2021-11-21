//
//  BlastHoleAppApp.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import SwiftUI

@main
struct BlastHoleAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(isStart: StartProgress())
        }
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
