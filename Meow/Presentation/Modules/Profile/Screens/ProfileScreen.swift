//
//  ProfileScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import SwiftUI
import Lottie

struct ProfileScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState,HomePageInput>
    @State private var pressCount = 0
    
    let animationName = "Lotties/11"
    
    var title: String = "Heart Button"
    
    var body: some View {
        HStack {
            LottieButton(animation: .named(animationName)) {
                pressCount += 1
            }
            .animate(fromMarker: "touchDownStart", toMarker: "touchDownEnd", on: .touchDown)
            .animate(fromMarker: "touchDownEnd", toMarker: "touchUpCancel", on: .touchUpOutside)
            .animate(fromMarker: "touchDownEnd", toMarker: "touchUpEnd", on: .touchUpInside)
            .frame(width: 80, height: 80)
            
            Text(verbatim: "\(title) (pressCount=\(pressCount))")
        }
    }
    
}

#Preview {
    ProfileScreen(viewModel: AnyViewModel(HomeViewModel()))
}
