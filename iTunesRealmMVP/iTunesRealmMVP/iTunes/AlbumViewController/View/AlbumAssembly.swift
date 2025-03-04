//
//  AlbumAssembly.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

struct AlbumAssembly {
    func build(with album: RealmAlbum) -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager()

        let presenter = AlbumPresenter(networkManager: networkManager,
                                       storageManager: storageManager,
                                       album: album
        )

        let albumViewController = AlbumViewController(presenter: presenter)

        presenter.view = albumViewController

        return albumViewController
    }
}
