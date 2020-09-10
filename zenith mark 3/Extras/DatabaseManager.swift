//
//  DatabaseManager.swift
//  zenithmark3
//
//  Created by Sriabhi Venkat on 8/7/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    public func test() {
        database.child("foo").setValue(["something": true])
    }
}
