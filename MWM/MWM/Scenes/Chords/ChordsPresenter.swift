//
//  ChordsPresenter.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsPresentationLogic {
    
    func presentChordsLabel(response: Chords.Main.Response)
    func presentAllKeys(response: Chords.AllKeys.Response)
}

class ChordsPresenter: ChordsPresentationLogic {
    
    weak var viewController: ChordsDisplayLogic?
    
    func presentChordsLabel(response: Chords.Main.Response) {
        
        var viewModel: Chords.Main.ViewModel
        
        viewModel = Chords.Main.ViewModel(titleLabel: response.titleLabel)
        self.viewController?.updateSelectedKeyLabel(viewModel: viewModel)
    }
    
    func presentAllKeys(response: Chords.AllKeys.Response) {
        var viewModel: Chords.AllKeys.ViewModel
        let keys: [String] = response.allKeysResponse?.allKeys?.map { $0.name } ?? []
        var chords: [String] = []
        
        // Get chords from keys (with corresponding chordId)
        chords = response.allKeysResponse?.allKeys?[response.selectedKey].keyChordIds.compactMap { chordId in
            return response.allKeysResponse?.allChords?.first(where: { $0.chordid == chordId }).map({ $0.suffix })
            } ?? []
        viewModel = Chords.AllKeys.ViewModel(keys: keys, chords: chords)
        viewController?.updateAllKeys(viewModel: viewModel)
    }
    
}
