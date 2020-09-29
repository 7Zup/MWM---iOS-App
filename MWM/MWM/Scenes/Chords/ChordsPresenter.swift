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
}

class ChordsPresenter: ChordsPresentationLogic {
    
    weak var viewController: ChordsDisplayLogic?
    
    func presentChordsLabel(response: Chords.Main.Response) {
        
        var viewModel: Chords.Main.ViewModel
        
        viewModel = Chords.Main.ViewModel(titleLabel: "Coucou")
        self.viewController?.updateKeyChordLabel(viewModel: viewModel)
    }
}
