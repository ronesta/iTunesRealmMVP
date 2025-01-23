//
//  SearchTerm.swift
//  iTunesRealmMVP
//
//  Created by Ибрагим Габибли on 23.01.2025.
//

import Foundation
import RealmSwift

class SearchTerm: Object {
    @objc dynamic var term: String = ""

    override static func primaryKey() -> String? {
        return "term"
    }
}
