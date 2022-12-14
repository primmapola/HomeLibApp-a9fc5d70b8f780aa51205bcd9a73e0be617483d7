//
//  wannaReadBooks.swift
//  HomeLibApp
//
//  Created by Grigory Don on 13.12.2022.
//

import Foundation
import RealmSwift

class WRBook: Object {
    
    @Persisted var name: String = ""
    @Persisted var author: String = ""
}
