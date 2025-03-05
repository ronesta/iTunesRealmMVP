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

        let presenter = AlbumPresenter(storageManager: storageManager,
                                       album: album
        )

        let albumViewController = AlbumViewController(presenter: presenter)

        presenter.view = albumViewController

        return albumViewController
    }
}
