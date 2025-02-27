//
//  SearchPresenterProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

protocol SearchPresenterProtocol: AnyObject {
    func viewDidLoad(with term: String)

    func fetchImageData(for imageId: Int) -> Data?
}
