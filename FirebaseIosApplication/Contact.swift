//
//  Card.swift
//  FirebaseTeste
//
//  Created by Mark Joselli on 15/03/24.
//

import Foundation

struct Contact: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
}
