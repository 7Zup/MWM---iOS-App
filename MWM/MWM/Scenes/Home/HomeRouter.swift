//
//  HomeRouter.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

@objc protocol HomeRoutingLogic {
    
    func routeToChords(containerView: UIView)
    func routeToWIP(containerView: UIView)
}

protocol HomeDataPassing {
    
    var data: HomeData? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {//}, DetailsDelegate {
    
    weak var viewController: HomeViewController?
    var data: HomeData?
    
    // MARK: - Chords
    
    func routeToChords(containerView: UIView) {
        let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "ChordsViewController") as! ChordsViewController

        // Perform navigation
        navigateToChords(source: viewController!, containerView: containerView, destination: destinationVC)
    }
    
    private func navigateToChords(source: HomeViewController, containerView: UIView, destination: ChordsViewController) {
        source.addChild(destination)
        
        containerView.addSubview(destination.view)
        destination.view.frame = containerView.bounds
        destination.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        destination.didMove(toParent: source)
    }
    
    // MARK: - Work in progress
    
    func routeToWIP(containerView: UIView) {
        let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "WIPViewController") as! WIPViewController
        
        // Perform navigation
        navigateToWIP(source: viewController!, containerView: containerView, destination: destinationVC)
    }
    
    private func navigateToWIP(source: HomeViewController, containerView: UIView, destination: WIPViewController) {
        source.addChild(destination)
        
        containerView.addSubview(destination.view)
        destination.view.frame = containerView.bounds
        destination.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        destination.didMove(toParent: source)
    }
    
}
