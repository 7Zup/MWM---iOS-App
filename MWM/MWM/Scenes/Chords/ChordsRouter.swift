//
//  ChordsRouter.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

@objc protocol ChordsRoutingLogic {
}

protocol ChordsDataPassing {
    
    var data: ChordsData? { get }
}

class ChordsRouter: NSObject, ChordsRoutingLogic, ChordsDataPassing {
    
    weak var viewController: ChordsViewController?
    var data: ChordsData?
}
