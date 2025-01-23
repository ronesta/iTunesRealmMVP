//
//  NetworkManagerProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit

protocol NetworkManagerProtocol: AnyObject {
    func loadAlbums(albumName: String, completion: @escaping ([Album]?, Error?) -> Void)

    func loadImage(from urlString: String, completion: @escaping (Data?, Error?) -> Void)
}
