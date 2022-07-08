//
//  StockVC.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/6.
//

import SwiftUI
import UIKit

class StockVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navi = self.navigationController else { return }
        navi.navigationBar.isHidden = true
 
        addHomeChildView()
    }
    
    func addHomeChildView() {
        
        let controller = UIHostingController(rootView: StockView())
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
