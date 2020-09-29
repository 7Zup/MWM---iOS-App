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
        
        struct Request {
            
            var urlParams: [String: String]
        }
        
        struct Response {
            
            var allKeysResponse: AllKeysResponse
        }
        
        struct ViewModel {
            
            var titleLabel: String
        }
    }
}
