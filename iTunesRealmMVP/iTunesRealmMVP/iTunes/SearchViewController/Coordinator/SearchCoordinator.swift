//
//  SearchCoordinator.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 06.03.2025.
//

import Foundation
import UIKit

final class SearchCoordinator: SearchCoordinatorProtocol {
    private let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func didSelect(album: RealmAlbum) {
        let albumAssembly = AlbumAssembly()

        let albumViewController = albumAssembly.build(with: album)
        viewController.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
