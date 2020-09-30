//
//  HomeViewController.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol HomeDisplayLogic: class {
    
    func displayChordsView(viewModel: Home.Main.ViewModel)
    func displayChromaticView(viewModel: Home.Main.ViewModel)
    func displayTunerView(viewModel: Home.Main.ViewModel)
    func displayMetronomeView(viewModel: Home.Main.ViewModel)
    func initTabBar(index: Int)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.data = interactor
    }
    
    private func initContent() {
        
        // Init tab bar
        tabBar.delegate = self
        interactor?.initTabBar(tabBar: tabBar)
    }
    
    // MARK: - Presenter protocol
    
    func initTabBar(index: Int) {

        tabBar.selectedItem = tabBar.items?[index]
        interactor?.selectTab(tab: index)
    }
    
    func displayChordsView(viewModel: Home.Main.ViewModel) {
        self.title = viewModel.navBarTitle
        router?.routeToChords(containerView: self.containerView)
    }
    
    func displayChromaticView(viewModel: Home.Main.ViewModel) {
        self.title = viewModel.navBarTitle
        router?.routeToWIP(containerView: self.containerView)
    }
    
    func displayTunerView(viewModel: Home.Main.ViewModel) {
        self.title = viewModel.navBarTitle
        router?.routeToWIP(containerView: self.containerView)
    }
    
    func displayMetronomeView(viewModel: Home.Main.ViewModel) {
        self.title = viewModel.navBarTitle
        router?.routeToWIP(containerView: self.containerView)
    }
    
}

extension HomeViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        containerView.subviews.last?.removeFromSuperview()
        interactor?.selectTab(tab: (tabBar.items?.firstIndex(of: item)) ?? 0)
    }
    
}
