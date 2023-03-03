//
//  albumsDetailsModel.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
struct AlbumDetailsModel: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias AlbumsDetailsResponse = [AlbumDetailsModel]
