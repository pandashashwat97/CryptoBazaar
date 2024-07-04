//
//  CircularRippleEffectView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 25/06/24.
//

import SwiftUI

struct CircularRippleEffectView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeOut(duration: 1) : .none, value: animate)
    }
}

#Preview {
    CircularRippleEffectView(animate: .constant(true))
}
