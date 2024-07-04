//
//  ViewModel.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 25/06/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            // waits 0.5 seconds before the rest of the code is executed
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map (filteredCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filteredCoins(text: String, coins:[CoinModel] ) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        return coins.filter { coin -> Bool in
            return coin.name.contains(lowercasedText) ||
                   coin.id.contains(lowercasedText) ||
                   coin.symbol.contains(lowercasedText)
        }
    }
}


