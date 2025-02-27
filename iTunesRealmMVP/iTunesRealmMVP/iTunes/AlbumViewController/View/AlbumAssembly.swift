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

        let albumViewController = AlbumViewController()

        let presenter = AlbumPresenter(view: albumViewController,
                                       networkManager: networkManager,
                                       storageManager: storageManager,
                                       album: album
        )

        albumViewController.presenter = presenter

        return albumViewController
    }
}
