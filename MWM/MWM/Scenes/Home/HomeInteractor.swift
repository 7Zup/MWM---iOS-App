//
//  HomeInteractor.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol HomeBusinessLogic {

    func initTabBar(tabBar: UITabBar)
    func selectTab(tab: Int)
}

protocol HomeData {
    
    var selectedTab: TabType? { get set }
}

enum TabType: Int {
    case Tuner = 0
    case Chromatic = 1
    case Chords = 2
    case Metronome = 3
}

class HomeInteractor: HomeBusinessLogic, HomeData {
    
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    var selectedTab: TabType?

    func initTabBar(tabBar: UITabBar) {
        // Interactor
        let index: Int
        if let items: [UITabBarItem] = tabBar.items, items.count > TabType.Chords.rawValue {
            index = TabType.Chords.rawValue
        } else {
            index = 0
        }
        presenter?.initTabBar(index: index)
    }
    
    func selectTab(tab: Int) {
        selectedTab = TabType(rawValue: tab)
        
        switch selectedTab {
        case .Tuner?:
            presentTunerView(navBarTitle: "Tuner")
        case .Chromatic?:
            presentChromaticView(navBarTitle: "Chromatic")
        case .Chords?:
            presentChordsView(navBarTitle: "Chords")
        case .Metronome?:
            presentMetronomeView(navBarTitle: "Metronome")
        default:
            presentTunerView(navBarTitle: "Tuner")
        }
    }
    
    private func presentTunerView(navBarTitle: String) {
        var response: Home.Main.Response
        
        response = Home.Main.Response(navBarTitle: navBarTitle)
        presenter?.presentTunerView(response: response)
    }
    
    private func presentChromaticView(navBarTitle: String) {
        var response: Home.Main.Response
        
        response = Home.Main.Response(navBarTitle: navBarTitle)
        presenter?.presentChromaticView(response: response)
    }
    
    private func presentChordsView(navBarTitle: String) {
        var response: Home.Main.Response
        
        response = Home.Main.Response(navBarTitle: navBarTitle)
        presenter?.presentChordsView(response: response)
    }
    
    private func presentMetronomeView(navBarTitle: String) {
        var response: Home.Main.Response
        
        response = Home.Main.Response(navBarTitle: navBarTitle)
        presenter?.presentMetronomeView(response: response)
    }
    
}
