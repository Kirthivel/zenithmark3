//
//  Chat.swift
//  zenithmark3
//
//  Created by Sriabhi Venkat on 8/10/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//



struct Chat{
    var users: [String]
    var dictionary: [String: Any] {
        return ["users": users]
    }
}

extension Chat {
    init?(dictionary: [String: Any]) {
        guard let chatUsers = dictionary["users"] as? [String] else {return nil}
        self.init(users: chatUsers)
    }
}
