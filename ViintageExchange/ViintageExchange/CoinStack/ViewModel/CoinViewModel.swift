//
//  CoinViewModel.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/7.
//

import Foundation
import Combine

class CoinViewModel:ObservableObject {
    
    @Published var allCoins:[Coin] = []
    private var coinDataService = CoinDataService()
    private var coinSubcription = Set<AnyCancellable>()
    
    init() {
        subscribeToCoinService()
    }
    
    func subscribeToCoinService() {
        
        coinDataService.$allCoins
            .sink { [weak self] coinFromDataService in
                guard let self = self else { return }
                self.allCoins = coinFromDataService
            }.store(in: &coinSubcription)
        
    }
    
    
}
