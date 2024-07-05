//
//  MeowApp.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/1.
//

import SwiftUI
import SwiftData
import Alamofire

@main
struct MeowApp: App {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
        .modelContainer(sharedModelContainer)
    }
}
