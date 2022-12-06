//
//  DataManager.swift
//  HomeLibApp
//
//  Created by Grigory Don on 06.12.2022.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    let realm = try! Realm()
    
    func createTempData(completion: @escaping () -> Void) {
        
        let testTask1 = Book(value: ["Name", "Author"])
        
        DispatchQueue.main.async {
            StorageManager.shared.save([testTask1])
            completion()
        }
    }
}
