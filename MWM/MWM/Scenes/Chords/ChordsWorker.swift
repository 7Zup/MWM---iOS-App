//
//  ChordsWorker.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsWorkerLogic {
    
    func getAllKeys(request: Chords.AllKeys.Request, completionHandler: @escaping (AllKeysResponse?) -> Void, errorHandler: @escaping (Error?) -> Void)
}

class ChordsWorker: ChordsWorkerLogic {
    
    func getAllKeys(request: Chords.AllKeys.Request, completionHandler: @escaping (AllKeysResponse?) -> Void, errorHandler: @escaping (Error?) -> Void) {
        
        APIManager.shared.request(urlString: "midi-chords", httpMethodType: "GET", urlParams: request.urlParams, completionHandler: completionHandler, errorHandler: errorHandler)
    }
}
