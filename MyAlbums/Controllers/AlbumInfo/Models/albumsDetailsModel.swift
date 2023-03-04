//
//  albumsDetailsModel.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
struct AlbumDetailsModel: Codable {
    let albumId, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias AlbumsDetailsResponse = [AlbumDetailsModel]
