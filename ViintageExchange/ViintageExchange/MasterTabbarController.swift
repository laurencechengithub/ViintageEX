//
//  MasterTabbarController.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/6.
//

import UIKit

class MasterTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().backgroundColor = UIColor.systemBackground.withAlphaComponent(0.5)
        viewControllers = [createStockNavigationControl(),createCoinNavigationControl()]
    }
    

    func createStockNavigationControl() -> UINavigationController {
        let stockVC = StockVC()
        let sfStockImg = UIImage(systemName: "chart.line.uptrend.xyaxis")
//        stockVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0 )
        stockVC.tabBarItem = UITabBarItem(title: "Stock", image: sfStockImg, tag: 0)
        
        return UINavigationController(rootViewController: stockVC)
    }
    
    func createCoinNavigationControl() -> UINavigationController {
        let coinVC = CoinVC()
        let sfCoinImg = UIImage(systemName: "bitcoinsign.circle")
//        coinVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        coinVC.tabBarItem = UITabBarItem(title: "Coin", image: sfCoinImg, tag: 1)
        return UINavigationController(rootViewController: coinVC)
    }

}
