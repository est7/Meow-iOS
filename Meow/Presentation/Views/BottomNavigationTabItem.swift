//
//  BottomNavigationTabItem.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/5.
//

import Lottie
import SwiftUI

struct BottomNavigationTabItem: View {
  var icon: String
  var title: String
  var tab: Tab
  @Binding var selectedTab: Tab
  @State private var isOn: Bool = false

  var body: some View {
    VStack {
        LottieSwitch(animation: .named(icon))
        .isOn($isOn)
        .onAnimation(
          fromProgress: 0,
          toProgress: 1
        )
        .offAnimation(
          fromProgress: 1,
          toProgress: 1
        )
        .frame(width: 30, height: 30)
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.1)) {
            selectedTab = tab
          }
          updateLottieState()
        }

      Text(title)
        .foregroundColor(selectedTab == tab ? .black: .gray)
        .font(.system(size: 10))
    }
    .onChange(of: selectedTab) {
      updateLottieState()
    }
    .onAppear {
      if selectedTab == tab {
        updateLottieState()
      }
    }
  }

  private func updateLottieState() {
    isOn = (selectedTab == tab)
  }
}

//#Preview {
//    BottomNavigationTabItem(selectedTab: <#T##Binding<Tab>#>, icon: <#T##String#>, title: <#T##String#>, tab: <#T##Tab#>)
//}
