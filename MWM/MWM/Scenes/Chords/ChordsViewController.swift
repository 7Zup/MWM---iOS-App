//
//  ChordsViewController.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.//

import Foundation
import UIKit

protocol ChordsDisplayLogic: class {
    
    func updateAllKeys(viewModel: Chords.AllKeys.ViewModel)
    func updateSelectedKeyLabel(viewModel: Chords.Main.ViewModel)
}

class ChordsViewController: UIViewController, ChordsDisplayLogic {

    var interactor: ChordsBusinessLogic?
    var router: (NSObjectProtocol & ChordsRoutingLogic & ChordsDataPassing)?
    
    var allKeysViewModel: Chords.AllKeys.ViewModel? = nil
    
    @IBOutlet weak var chordsLabel: UILabel!
    @IBOutlet weak var keysCollectionView: UICollectionView!
    @IBOutlet weak var chordsCollectionView: UICollectionView!
    
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
        self.displaySimpleLoadingView()
        keysCollectionView.delegate = self
        keysCollectionView.dataSource = self
        keysCollectionView.register(UINib(nibName: "ChordsCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "keyCell")
        chordsCollectionView.delegate = self
        chordsCollectionView.dataSource = self
        chordsCollectionView.register(UINib(nibName: "ChordsCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: "chordCell")
        
        interactor?.viewDidLoad()
    }
    
    // MARK: - Presenter protocol
    
    func updateAllKeys(viewModel: Chords.AllKeys.ViewModel) {
        allKeysViewModel = viewModel
        DispatchQueue.main.async {
            self.keysCollectionView.reloadData() // not sure
            self.chordsCollectionView.reloadData() // not sure
            self.chordsCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
            self.dismissSimpleLoadingView()
        }
    }
    
    func updateSelectedKeyLabel(viewModel: Chords.Main.ViewModel) {
        DispatchQueue.main.async {
            self.chordsLabel.text = viewModel.titleLabel
        }
    }
    
}

extension ChordsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems: Int
        
        if collectionView == keysCollectionView {
            numberOfItems = allKeysViewModel?.keys.count ?? 0
        } else if collectionView == chordsCollectionView {
            numberOfItems = allKeysViewModel?.chords.count ?? 0
        } else {
           numberOfItems = 0
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell
        
        if collectionView == keysCollectionView,
            let keyCell: ChordsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "keyCell",
                                                                                       for: indexPath) as? ChordsCollectionViewCell {
            
            keyCell.titleLabel.text = allKeysViewModel?.keys[indexPath.row]
            cell = keyCell
        } else if collectionView == chordsCollectionView,
            let chordCell: ChordsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "chordCell",
                                                                                         for: indexPath) as? ChordsCollectionViewCell {
            
            chordCell.titleLabel.text = allKeysViewModel?.chords[indexPath.row]
            cell = chordCell
        } else {
            cell = UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == keysCollectionView {
            interactor?.selectKey(with: indexPath)
        } else if collectionView == chordsCollectionView {
            interactor?.selectChord(with: indexPath)
        }
    }
    
}
