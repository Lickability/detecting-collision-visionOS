//
//  ContentView.swift
//  DetectingCollision
//
//  Created by Mikaela on 7/19/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var sphere: Entity?
    @State private var subscription: EventSubscription?

    var body: some View {
        VStack {
            RealityView { content in
                // Add the initial RealityKit content
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                    sphere = content.entities.first?.findEntity(named: "Sphere")
                    
                    subscription = content.subscribe(to: CollisionEvents.Began.self, on: sphere) { collisionEvent in
                        print("💥 Collision between \(collisionEvent.entityA.name) and \(collisionEvent.entityB.name)")
                    }
                }
            }
            .gesture(
                DragGesture()
                    .targetedToEntity(sphere ?? Entity())
                    .onChanged { value in
                        guard let sphere, let parent = sphere.parent else {
                            return
                        }
                        
                        sphere.position = value.convert(value.location3D, from: .local, to: parent)
                    }
            )
        }
    }
}

#Preview {
    ContentView()
}
