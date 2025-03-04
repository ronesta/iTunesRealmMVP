//
//  SearchPresenterProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

protocol SearchPresenterProtocol: AnyObject {
    func searchButtonClicked(with term: String)
    func didTypeSearch(_ searchQuery: String)
}
