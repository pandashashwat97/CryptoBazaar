//
//  HomeStatsView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 06/10/24.
//

import SwiftUI

struct HomeStatsView: View {

    @EnvironmentObject private var vm: ViewModel
    @Binding var showPortfolio: Bool
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticsView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3 )
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing: .leading )
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
}
