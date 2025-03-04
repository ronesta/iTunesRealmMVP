//
//  StorageManagerProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation

protocol StorageManagerProtocol: AnyObject {
    func saveAlbums(_ albums: [(album: Album, imageData: Data?)], for searchTerm: String)

    func fetchAlbums(for searchTerm: String) -> [RealmAlbum]

    func saveSearchTerm(_ term: String)

    func getSearchHistory() -> [String]

    func fetchImageData(forImageId id: Int) -> Data?
}
