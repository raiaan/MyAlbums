//
//  AlbumsModel.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
struct AlbumModel: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [AlbumModel]
