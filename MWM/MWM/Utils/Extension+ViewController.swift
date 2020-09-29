//
//  Extension+ViewController.swift
//  MWM
//
//  Created by Fabrice Froehly on 30/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Display / Dismiss a simple loading view while background isn't stable
    
    func displaySimpleLoadingView() {
        
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissSimpleLoadingView() {
        
        if let vc = self.presentedViewController,
            vc is UIAlertController,
            vc.view.subviews.first(where: { $0.isKind(of: UIActivityIndicatorView.self) }) != nil {
            dismiss(animated: false, completion: nil)
        }
    }
}
