//
//  ChatScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import SwiftUI

struct ChatScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState,HomePageInput>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

}

#Preview {
    ChatScreen(viewModel: AnyViewModel(HomeViewModel()))
}

