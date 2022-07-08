//
//  CoinDataService.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/7.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins:[Coin] = []
    var coinSubcription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
            guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else { return }

        coinSubcription = NetworkManager.download(url: url)
                .decode(type: [Coin].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                    self?.coinSubcription?.cancel()
                })
        }
    
    
}
