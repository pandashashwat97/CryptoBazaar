//
//  ViewModel.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 25/06/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] =
    [StatisticsModel(title: "Title", value: "Value", percentageChange: 1.0),
     StatisticsModel(title: "Title", value: "Value"),
     StatisticsModel(title: "Title", value: "Value"),
     StatisticsModel(title: "Title", value: "Value", percentageChange: -7.0)]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins.sink { [weak self] (returnedCoins) in
            self?.allCoins = returnedCoins
        }
        .store(in: &cancellables)
        
        $searchText
            .combineLatest(dataService.$allCoins)
            // waits 0.5 seconds before the rest of the code is executed
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowerCasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowerCasedText) ||
            coin.symbol.lowercased().contains(lowerCasedText) ||
            coin.id.lowercased().contains(lowerCasedText)
        }
    }
}


