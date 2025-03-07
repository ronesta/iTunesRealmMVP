//
//  SearchHistoryAssembly.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

struct SearchHistoryAssembly {
    func build() -> UIViewController {
        let storageManager = StorageManager()

        let presenter = SearchHistoryPresenter(storageManager: storageManager)
        let tableViewDataSource = SearchHistoryTableViewDataSource()

        let viewController = SearchHistoryViewController(presenter: presenter,
                                                         tableViewDataSource: tableViewDataSource
        )

        presenter.view = viewController

        let navigationController = UINavigationController(rootViewController: viewController)
        let coordinator = SearchHistoryCoordinator(navigationController: navigationController)

        configureOnSelect(for: viewController, with: tableViewDataSource, coordinator: coordinator)

        let tabBarItem = UITabBarItem(title: "History",
                                      image: UIImage(systemName: "clock"),
                                      tag: 1)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    private func configureOnSelect(for viewController: SearchHistoryViewController,
                                   with tableViewDataSource: SearchHistoryTableViewDataSource,
                                   coordinator: SearchHistoryCoordinatorProtocol
    ) {
        viewController.onSelect = { indexPath in
            let selectedTerm = tableViewDataSource.searchHistory[indexPath.row]
            coordinator.didSelectSearchQuery(with: selectedTerm)
        }
    }
}
