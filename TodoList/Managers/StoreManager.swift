//
//  StoreManager.swift
//  TodoList
//
//  Created by Dmitry on 12.05.2021.
//

import Foundation
import CoreData

class StoreManager {
    
    static let shared = StoreManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    
    func fetchData() -> [Task] {
        var tasks = [Task]()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        return tasks
    }
    
    func save(data: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: persistentContainer.viewContext) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: persistentContainer.viewContext) as? Task else { return }
        
        task.title = data
        saveData(context: persistentContainer.viewContext)
    }
    
    func delete( data: Task) {
        persistentContainer.viewContext.delete(data)
        saveData(context: persistentContainer.viewContext)
    }
    
    func change(in task: String?, at index: Int) {
        var tasks = fetchData()
        let selectedTask = tasks.remove(at: index)
        selectedTask.title = task
        
        tasks.insert(selectedTask, at: index)
        saveData(context: persistentContainer.viewContext)
    }
    
    private func saveData(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
    }  
}
