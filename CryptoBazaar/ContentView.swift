//
//  ContentView.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        VStack {
            NavigationStack{
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
