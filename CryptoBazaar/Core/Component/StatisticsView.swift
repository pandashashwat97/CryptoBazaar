//
//  StatisticsView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 06/10/24.
//

import SwiftUI

struct StatisticsView: View {
    let stat: StatisticsModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.white)
            Text(stat.value)
                .font(.title)
                .foregroundStyle(Color.text)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text("\(String(format: "%.2f", stat.percentageChange ?? 0.0)) %")
                    .font(.caption)
                .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.green : Color.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    StatisticsView(stat: StatisticsModel(title: "Market Cap", value: "$12.58Bn", percentageChange: 25.00))
}
