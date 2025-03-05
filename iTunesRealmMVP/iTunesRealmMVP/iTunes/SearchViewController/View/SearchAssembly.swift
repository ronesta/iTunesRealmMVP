//
//  SearchAssembly.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

struct SearchAssembly {
    func build() -> UIViewController {
        let storageManager = StorageManager()
        let iTunesManager = ITunesManager()
        let imageDataFetcher = ImageDataFetcher(storageManager: storageManager)

        let presenter = SearchPresenter(iTunesManager: iTunesManager,
                                        storageManager: storageManager
        )

        let collectionViewDataSource = SearchCollectionViewDataSource(imageDataFetcher: imageDataFetcher)

        let viewController = SearchViewController(presenter: presenter,
                                                  collectionViewDataSource: collectionViewDataSource
        )

        presenter.view = viewController

        configureOnSelect(for: viewController, with: collectionViewDataSource)

        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: "Search",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag: 0)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    private func configureOnSelect(for viewController: SearchViewController,
                                   with collectionViewDataSource: SearchCollectionViewDataSource
    ) {
        viewController.onSelect = { [weak viewController] indexPath in
            let album = collectionViewDataSource.albums[indexPath.item]
            let albumAssembly = AlbumAssembly()

            let albumViewController = albumAssembly.build(with: album)

            viewController?.navigationController?.pushViewController(albumViewController, animated: true)
        }
    }
}
