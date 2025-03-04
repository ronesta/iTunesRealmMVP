//
//  AlbumViewProtocol.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import UIKit.UIImage

protocol AlbumViewProtocol: AnyObject {
    func displayAlbumDetails(album: RealmAlbum, image: UIImage)
}
