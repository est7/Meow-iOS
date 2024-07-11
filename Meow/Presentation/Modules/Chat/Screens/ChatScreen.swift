//
//  ChatScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import SwiftUI

// 定义一个 ObservableObject 类来管理状态
class ChatCounter: ObservableObject {
    @Published var count = 0
}

struct UserIdKey：EnvironmentKey {
    static var defaultValue：=""}

extension EnvironmentValues {
    var userId: String {
        get {self
        set {self[UserIdKey.self] = newValue } }
}

struct ChatScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState, HomePageInput>
    @StateObject private var counter = ChatCounter() // 创建一个共享的 Counter 实例
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    // Action for Home Button
                }) {
                    Text("Chat Button")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                MainView()
            }
        }
    }
}



// 主视图中的子视图，包含导航链接到另一个视图
struct MainView: View {
    @StateObject private var counter = ChatCounter() // 创建一个 Counter 实例
    
    var body: some View {
        VStack {
            Text("MainView Count: \(counter.count)")
            Button("Increment in MainView") {
                counter.count += 1
            }
            NavigationLink(destination: DetailView()) {
                Text("Go to DetailView")
            }
        }
        .padding()
    }
}

// 详细视图，在导航链接中加载
struct DetailView: View {
    @StateObject private var counter = ChatCounter() // 创建一个 Counter 实例
    
    var body: some View {
        VStack {
            Text("DetailView Count: \(counter.count)")
            Button("Increment in DetailView") {
                counter.count += 1
            }
        }
        .padding()
    }
}

#Preview {
    ChatScreen(viewModel: AnyViewModel(HomeViewModel()))
}
