//
//  ChordsModels.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

enum Chords {
    
    enum Main {
        
        struct Response {
            var titleLabel: String
        }
        
        struct ViewModel {
            
            var titleLabel: String
        }
    }
    
    enum AllKeys {
        
        struct Request {
            
            var urlParams: [String: String]
        }
        
        struct Response {
            
            var allKeysResponse: AllKeysResponse?
            var selectedKey: Int
            var selectedChord: Int
        }
        
        struct ViewModel {
            
            var keys: [String]
            var chords: [String]
        }
    }
}
