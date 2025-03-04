//
//  SearchPresenter.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

final class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?

    private let networkManager: NetworkManagerProtocol
    private let storageManager: StorageManagerProtocol

    private var albums = [RealmAlbum]()

    init(networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    private func saveSearchTerm(_ term: String) {
        storageManager.saveSearchTerm(term)
    }

    func didTypeSearch(_ searchQuery: String) {
        guard !searchQuery.isEmpty else {
            return
        }

        searchAlbums(with: searchQuery)
    }

    func searchButtonClicked(with term: String?) {
        guard let term, !term.isEmpty else {
            return
        }

        saveSearchTerm(term)
        searchAlbums(with: term)
    }

    func searchFromHistory(with term: String) {
        searchAlbums(with: term)
    }

    private func searchAlbums(with term: String) {
        albums = storageManager.fetchAlbums(for: term)

        guard albums.isEmpty else {
            view?.updateAlbums(albums)
            return
        }

        networkManager.loadAlbums(albumName: term) { [weak self] result, error  in
            if let error {
                print("Error getting albums: \(error)")
                return
            }

            guard let result else {
                return
            }

            var albumsToSave: [(album: Album, imageData: Data)] = []
            let group = DispatchGroup()

            result.forEach { res in
                group.enter()
                self?.networkManager.loadImage(from: res.artworkUrl100) { data, error in
                    if let error {
                        print("Failed to load image: \(error)")
                        return
                    }

                    guard let data else {
                        print("No data for image")
                        return
                    }

                    albumsToSave.append((album: res, imageData: data))
                    group.leave()
                }
            }

            group.notify(queue: .main) { [weak self] in
                guard let self else {
                    return
                }

                storageManager.saveAlbums(albumsToSave, for: term)
                print("Successfully loaded \(albumsToSave.count) albums.")

                DispatchQueue.main.async {
                    self.albums = self.storageManager.fetchAlbums(for: term)
                    self.view?.updateAlbums(self.albums)
                }
            }
        }
    }
}
