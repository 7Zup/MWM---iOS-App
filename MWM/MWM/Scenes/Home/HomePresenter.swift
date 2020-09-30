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
    func presentMetronomeView(response: Home.Main.Response)
    func presentChromaticView(response: Home.Main.Response)
    func presentTunerView(response: Home.Main.Response)
    func initTabBar(index: Int)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    func initTabBar(index: Int) {
        viewController?.initTabBar(index: index)
    }
    
    func presentChordsView(response: Home.Main.Response) {
        
        var viewModel: Home.Main.ViewModel
        
        viewModel = Home.Main.ViewModel(navBarTitle: response.navBarTitle)
        viewController?.displayChordsView(viewModel: viewModel)
    }
    
    func presentMetronomeView(response: Home.Main.Response) {
        var viewModel: Home.Main.ViewModel
        
        viewModel = Home.Main.ViewModel(navBarTitle: response.navBarTitle)
        viewController?.displayMetronomeView(viewModel: viewModel)
    }
    
    func presentChromaticView(response: Home.Main.Response) {
        var viewModel: Home.Main.ViewModel
        
        viewModel = Home.Main.ViewModel(navBarTitle: response.navBarTitle)
        viewController?.displayChromaticView(viewModel: viewModel)
    }
    
    func presentTunerView(response: Home.Main.Response) {
        var viewModel: Home.Main.ViewModel
        
        viewModel = Home.Main.ViewModel(navBarTitle: response.navBarTitle)
        viewController?.displayTunerView(viewModel: viewModel)
    }
}
