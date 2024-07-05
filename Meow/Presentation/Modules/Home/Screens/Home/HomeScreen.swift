//
//  HomeScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState,HomePageInput>
    @State var selectedTab:Tab = .home
    
    init(viewModel: AnyViewModel<HomePageState, HomePageInput>) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button(action: {
                    // Action for Home Button
                }) {
                    Text("Home Button")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}



#Preview {
    HomeScreen(viewModel:AnyViewModel(HomeViewModel()))
}
