//
//  ProfileScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState,HomePageInput>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

}

#Preview {
    ProfileScreen(viewModel: AnyViewModel(HomeViewModel()))
}
