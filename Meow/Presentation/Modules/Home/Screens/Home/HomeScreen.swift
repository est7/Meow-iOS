//
//  HomeScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import SwiftUI

class TestObserableObjectViewModel: ObservableObject{
    @Published var nameList = ["Alice", "Bob", "Charlie"]
    
    func addName(name: String) {
        nameList.append(name)
    }
    
    func removeNameLast() {
        nameList.remove(at: nameList.count - 1)
    }
    
    func getNameList() -> [String] {
        return nameList
    }
    
}

struct HomeScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState, HomePageInput>
    
    @State var selectedTab: Tab = .home
    
    private var loginBinding: Binding<Bool> {
        Binding<Bool>{
            return true
        } set: { _ in
        }
        
    }
    
    init(viewModel: AnyViewModel<HomePageState, HomePageInput>) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    // Action for Home Button
                }) {
                    Text("Home Button")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }.padding()
                ParentView()
            }
        }
    }
}

struct ParentView: View {
    @State var text = "Hello, World!"
    var body: some View {
        VStack {
            Text("Parent View")
            Text(text)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)  // Center the text horizontally
            TextField("Enter text", text: $text)
                .frame(maxWidth: .infinity, alignment: .center)  // Center the text field horizontally
            ChildView(text: $text)
        }
    }
}

struct ChildView: View {
    @Binding var text: String
    
    @State var isToggleOn = false
    var body: some View {
        VStack {
            Toggle("这是一个开关", isOn: $isToggleOn.animation())
            Text(text)
            TextField("Enter text", text: $text)
        }
    }
    
}

#Preview {
    HomeScreen(viewModel: AnyViewModel(HomeViewModel()))
}
