//
//  Books.swift
//  HomeLibApp
//
//  Created by Ma Millerr on 24.10.2022.
//

import Foundation
import RealmSwift

class Book: Object {
    
    @Persisted var name = ""
    @Persisted var author = ""
    @Persisted var genre = ""
    @Persisted var translator = ""
    @Persisted var status = ""
    @Persisted var pubHouse = ""
    @Persisted var location = ""
    @Persisted var image = ""
    @Persisted var isFavourite = false
    
}
