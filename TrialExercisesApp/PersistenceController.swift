//
//  PersistenceController.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 07/03/2021.
//

import Foundation
import CoreData

// Inspired by https://www.hackingwithswift.com/quick-start/swiftui/introduction-to-using-core-data-with-swiftui
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FavouritePlayers")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { desciption, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Could not save to DB")
            }
        }
    }
}
