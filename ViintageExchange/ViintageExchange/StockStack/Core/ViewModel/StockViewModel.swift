//
//  HomeViewModel.swift
//  ViitageEX
//
//  Created by LaurenceMBP2 on 2022/7/4.
//

import Foundation
import Combine

class StockViewModel: ObservableObject {
    
    @Published var allQuotes:[Quote] = []
    @Published var quoteIntraday:[QuoteIntraday] = []
    
    private var quoteDataService = QuoteDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addquoteSubscriber()
    }
    
    func addquoteSubscriber() {
        
        quoteDataService.$firstTenQuote
        //sink to observe values received by the publisher
            .sink { [weak self] (quoteFromService) in
                guard let self = self else {
                    return
                }
                self.allQuotes = quoteFromService
            }
            .store(in: &cancellables)

        
    }

    
}
