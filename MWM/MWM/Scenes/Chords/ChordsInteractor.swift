//
//  ChordsInteractor.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsBusinessLogic {

    func getKeyList()
    func updateSelectedKey(with index: IndexPath)
    func updateSelectedChord(with index: IndexPath)
}

protocol ChordsData {
    
    var allKeys: AllKeysResponse? { get set }
    var selectedKey: String? { get set }
    var selectedChord: String? { get set }
}

class ChordsInteractor: ChordsBusinessLogic, ChordsData {
    
    var presenter: ChordsPresentationLogic?
    var worker: ChordsWorker?
    
    var allKeys: AllKeysResponse?
    var selectedKey: String?
    var selectedChord: String?

    // MARK: - Update values
    
    func updateSelectedKey(with index: IndexPath) {
        
        //self.selectedKey = index
        // TODO: - Update label
    }
    
    func updateSelectedChord(with index: IndexPath) {
        
        //self.selectedChord = index
        // TODO: - Update chordList
        // TODO: - Update label
    }
    
    // MARK: - Get All Keys
    
    func getKeyList() {
        
        let urlParams = [String: String]()
        self.worker?.getAllKeys(request: Chords.Main.Request(urlParams: urlParams), completionHandler: allKeyCompletionHandler, errorHandler: allKeyErrorHandler)
    }
    
    func allKeyCompletionHandler(response: AllKeysResponse?) {

        if let allKeys: AllKeysResponse = response {
            self.allKeys = allKeys
            // CALL PRESENTER & Update collection views
        }
    }
    
    func allKeyErrorHandler(error: Error?) {
        
        if let error: Error = error {
            print("Error in allKeyErrorHandler: ", error)
        } else {
            print("Error - ChordsInteractor - allKeyErrorHandler - Could not fetch data")
        }
    }
}
