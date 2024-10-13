//
//  HomeView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 24/06/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: ViewModel
    @State private var coinData: [CoinModel] = []
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack {
            // background color
            LinearGradient(colors: [.cyan, .black], startPoint: .top, endPoint: .bottom)
            // content layer
            VStack{
                headerView()
                HomeStatsView(showPortfolio: $showPortfolio)
                SerachBarView(searchString: $vm.searchText)
                columnTitles()
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 20))
                if !showPortfolio {
                    allCoinsList()
                    .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList()
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .task {
            
        }
    }
    // Header View
    func headerView() -> some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background {
                    CircularRippleEffectView(animate: $showPortfolio)
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.black)
                .animation(.none, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(5)
        .background{
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.yellow)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 40)
                .stroke(lineWidth: 2)
        }
        .padding(EdgeInsets(top: 60, leading: 20, bottom: 10, trailing: 20))
    }
    // Column Titles
    func columnTitles() -> some View {
        HStack{
            Text("Coin")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
            Spacer()
            if showPortfolio {
                Text("Holdings")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
        }
    }
    // All coins list
    func allCoinsList() -> some View {
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldings: false)
            }
        }
        .listStyle(PlainListStyle())
    }// Portfolio coins list
    func portfolioCoinsList() -> some View {
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldings: true)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    HomeView()
        .environmentObject(ViewModel())
}
