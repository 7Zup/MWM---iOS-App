//
//  ChordsViewController.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsDisplayLogic: class {
    
    func updateKeyChordLabel(viewModel: Chords.Main.ViewModel)
}

class ChordsViewController: UIViewController, ChordsDisplayLogic {
    
    var interactor: ChordsBusinessLogic?
    var router: (NSObjectProtocol & ChordsRoutingLogic & ChordsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.initContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    // MARK: - Initilize content
    
    // Setup all the parts of the VIP Architecture
    private func setup() {
        
        let viewController = self
        let interactor = ChordsInteractor()
        let presenter = ChordsPresenter()
        let router = ChordsRouter()
        let worker = ChordsWorker()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.data = interactor
    }
    
    private func initContent() {
        interactor?.getKeyList()
    }
    
    // MARK: - Presenter protocol
    
    func updateKeyChordLabel(viewModel: Chords.Main.ViewModel) {
        print("Chords VIEW CONTROLLER - Title label: \(viewModel.titleLabel)")
    }
    
}
