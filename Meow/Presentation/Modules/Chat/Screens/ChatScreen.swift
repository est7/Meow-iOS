//
//  ChatScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import SwiftUI

struct ChatScreen: View {
  @ObservedObject var viewModel: AnyViewModel<HomePageState, HomePageInput>

  var body: some View {
    ZStack {
      Color.red.edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        Button(action: {
          // Action for Home Button
        }) {
          Text("Chat Button")
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
        }
        Spacer()
      }
    }
  }
}

#Preview {
  ChatScreen(viewModel: AnyViewModel(HomeViewModel()))
}
