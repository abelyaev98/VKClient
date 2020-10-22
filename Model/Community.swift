//
//  Community.swift
//  VKClient
//
//  Created by Alexander Belyaev on 19.10.2020.
//

import Foundation

struct Community {
    var name: String
    var avatar: String
    
    // MARK: - Fake Community

    static var randomOne: Community {
        return Community(name: Lorem.words(3),
                         avatar: String(Int.random(in: 1...20)))
    }

    static var randomMany: [Community] {
        return (1...10).map { _ in Community.randomOne }
    }
}
