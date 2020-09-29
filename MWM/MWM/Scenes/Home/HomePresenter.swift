//
//  HomePresenter.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol HomePresentationLogic {
    
    func presentChordsView(response: Home.Main.Response)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    func presentChordsView(response: Home.Main.Response) {
        
        var viewModel: Home.Main.ViewModel
        
        viewModel = Home.Main.ViewModel(navBarTitle: "Chords")
        viewController?.displayChordsView(viewModel: viewModel)
    }
    
}
