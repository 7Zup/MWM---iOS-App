//
//  ChordsInteractor.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsBusinessLogic {

    func viewDidLoad()
    func selectKey(with index: IndexPath)
    func selectChord(with index: IndexPath)
}

protocol ChordsData {
    
    var allKeys: AllKeysResponse? { get set }
}

class ChordsInteractor: ChordsBusinessLogic, ChordsData {
    
    var presenter: ChordsPresentationLogic?
    var worker: ChordsWorker?
    
    var allKeys: AllKeysResponse?
    var keySelectedIndex: Int = 0
    var chordSelectedIndex: Int = 0
    
    func selectKey(with index: IndexPath) {
        if index.row != keySelectedIndex {
            keySelectedIndex = index.row
            chordSelectedIndex = 0
            refreshAllKeys()
            setTitleLabel()
        }
    }
    
    func selectChord(with index: IndexPath) {
        if index.row != chordSelectedIndex {
            chordSelectedIndex = index.row
            setTitleLabel()
        }
    }
    
    func viewDidLoad() {
        getKeyList()
        setTitleLabel()
    }
    
    private func setTitleLabel() {
        let title: String
        
        if let keyString: String = allKeys?.allKeys?[keySelectedIndex].name,
            let chordString: String = allKeys?.allChords?[chordSelectedIndex].suffix {
            title = "\(keyString) \(chordString)"
        } else {
            title = ""
        }
        presenter?.presentChordsLabel(response: Chords.Main.Response(titleLabel: title))
    }
    
    // MARK: - Get All Keys
    
    private func getKeyList() {
        
        let urlParams = [String: String]()
        self.worker?.getAllKeys(request: Chords.AllKeys.Request(urlParams: urlParams),
                                completionHandler: allKeysCompletionHandler,
                                errorHandler: allKeysErrorHandler)
    }
    
    func allKeysCompletionHandler(response: AllKeysResponse?) {

        if let allKeys: AllKeysResponse = response {
            self.allKeys = allKeys
            refreshAllKeys()
            setTitleLabel()
        }
    }
    
    private func refreshAllKeys() {
        let response: Chords.AllKeys.Response = Chords.AllKeys.Response(allKeysResponse: allKeys,
                                                                        selectedKey: keySelectedIndex,
                                                                        selectedChord: chordSelectedIndex)
        presenter?.presentAllKeys(response: response)
    }
    
    func allKeysErrorHandler(error: Error?) {
        
        if let error: Error = error {
            print("Error in allKeyErrorHandler: ", error)
        } else {
            print("Error - ChordsInteractor - allKeyErrorHandler - Could not fetch data")
        }
    }
}
