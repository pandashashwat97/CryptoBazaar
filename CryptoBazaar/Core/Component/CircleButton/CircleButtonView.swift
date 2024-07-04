//
//  CircleButtonView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 24/06/24.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.accentColor)
            .frame(width: 70, height: 70)
            .background(
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 50, height: 50)
            )
            .shadow(color: Color.black.opacity(0.25), radius: 10, x:0, y:0)
    }
}

#Preview {
    CircleButtonView(iconName: "plus")
        .padding()
        .previewLayout(.sizeThatFits)
}
