//
//  DetectingCollisionApp.swift
//  DetectingCollision
//
//  Created by Mikaela on 7/19/23.
//

import SwiftUI

@main
struct DetectingCollisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 1, depth: 1, in: .meters)
    }
}
