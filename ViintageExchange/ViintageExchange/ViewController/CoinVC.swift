//
//  CoinVC.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/7.
//

import SwiftUI
import UIKit

class CoinVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCoinViewToChild()
        navigationController?.navigationBar.isHidden = true
    }
    
    func addCoinViewToChild() {
        
        let controller = UIHostingController(rootView: CoinView())
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}
