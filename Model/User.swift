//
//  User.swift
//  VKClient
//
//  Created by Alexander Belyaev on 19.10.2020.
//

import Foundation

struct User {
    var name: String
    var avatar: String
    var photos: [String]
    
    // MARK: - Fake User
    
    static var randomOne: User {
        return User(name: Lorem.fullName,
                    avatar: String(Int.random(in: 1...20)),
                    photos: (1...6).map { _ in String(Int.random(in: 1...20)) }
        )
    }
    
    static var randomMany: [User] {
        return (1...10).map { _ in User.randomOne }
    }
    
}
