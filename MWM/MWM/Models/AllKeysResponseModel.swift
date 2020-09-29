//
//  AllKeysResponseModel.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

import Foundation

struct AllKeysResponse: Codable  {
    var allKeys: [Key]?
    var allChords: [Chord]?
    
    enum CodingKeys: String, CodingKey {
        case allKeys = "allkeys"
        case allChords = "allchords"
    }
}

struct Key: Codable {
    var keyId: Int
    var name: String
    var keyChordIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case keyId = "keyid"
        case name = "name"
        case keyChordIds = "keychordids"
    }
}

struct Chord: Codable {
    var midi: [Int]
    var suffix: String
    var fingers: [Int]
    var chordid: Int
}
