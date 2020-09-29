//
//  HomeInteractor.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol HomeBusinessLogic {

    func selectTab(tab: Int)
}

protocol HomeData {
    
    var selectedTab: TabType? { get set }
}

enum TabType: Int {
    case Chords = 0
}

class HomeInteractor: HomeBusinessLogic, HomeData {
    
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    var selectedTab: TabType?

    func selectTab(tab: Int) {
        selectedTab = TabType(rawValue: tab)
        presentChordsView()
    }
    
    func presentChordsView() {
        var response: Home.Main.Response
        
        response = Home.Main.Response(navBarTitle: "Chords")
        presenter?.presentChordsView(response: response)
    }
}
