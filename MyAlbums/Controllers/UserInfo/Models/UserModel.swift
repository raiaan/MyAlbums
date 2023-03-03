//
//  UserModel.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
struct UserModel: Codable {
    let id: Int
    let name: String
    let address: Address
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
}
typealias Users = [UserModel]
