//
//  SearchHistoryPresenterProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation

protocol SearchHistoryPresenterProtocol: AnyObject {
    init(view: SearchHistoryViewProtocol, storageManager: StorageManagerProtocol)

    func loadSearchHistory()
}
