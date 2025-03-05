//
//  AlbumPresenter.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit.UIImage

class AlbumPresenter: AlbumPresenterProtocol {
    weak var view: AlbumViewProtocol?

    private let storageManager: StorageManagerProtocol

    private let album: RealmAlbum

    init(storageManager: StorageManagerProtocol,
         album: RealmAlbum
    ) {
        self.storageManager = storageManager
        self.album = album
    }

    func viewDidLoad() {
        loadAlbumDetails()
    }

    private func loadAlbumDetails() {
        guard let imageData = storageManager.fetchImageData(forImageId: Int(album.artistId)),
              let image = UIImage(data: imageData) else {
            return
        }

            view?.displayAlbumDetails(album: album, image: image)
    }
}
