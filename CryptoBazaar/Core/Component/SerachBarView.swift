//
//  SerachBarView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 04/07/24.
//

import SwiftUI
import SwiftUISpeechToText

struct SerachBarView: View {
    @Binding var searchString: String
    var body: some View {
        TranscribedTextFieldView(color: Color.text, searchText: $searchString, placeHolderColor: Color.text, micIconWidth: 15)
            .shadow(color: Color.black.opacity(0.25), radius: 10, x:0, y:0)
    }
}

#Preview {
    SerachBarView(searchString: .constant(""))
}
