//
//  SearchHistoryPresenter.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation

final class SearchHistoryPresenter: SearchHistoryPresenterProtocol {
    weak var view: SearchHistoryViewProtocol?

    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func viewDidLoad() {
        loadSearchHistory()
    }

    private func loadSearchHistory() {
        let history = storageManager.getSearchHistory()
        view?.updateSearchHistory(history)
    }
}
