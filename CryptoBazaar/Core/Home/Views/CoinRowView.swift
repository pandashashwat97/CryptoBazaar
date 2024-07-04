//
//  CoinRowView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 25/06/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldings: Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumnView()
            Spacer()
            if showHoldings {
                centerColumnView()
            }
            rightColumnView()
        }
    }
    // Left Column View
    func leftColumnView() -> some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.text)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.accentColor)
        }
    }
    // Center Column View
    func centerColumnView() -> some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0)
                .asNumberStringWithDecimals())
                .bold()
        }
        .foregroundStyle(Color.accentColor)
    }
    // Right Column View
    func rightColumnView() -> some View {
        VStack(alignment: .trailing){
            Text("\(( coin.currentPrice).asCurrencyWith2Decimals())")
                .bold()
                .foregroundStyle(Color.text)
            Text("\(( coin.priceChangePercentage24H ?? 0).asNumberStringWithDecimals())%")
                .bold()
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.green : Color.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldings: true)
}

