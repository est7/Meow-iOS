//
//  BottomNavigationBar.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/5.
//

import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            BottomNavigationTabItem(icon: "house", title: "Home", tab: .home, selectedTab: $selectedTab)
            Spacer()
            BottomNavigationTabItem(icon: "message", title: "Chat", tab: .chat, selectedTab: $selectedTab)
            Spacer()
            BottomNavigationTabItem(icon: "person", title: "Me", tab: .profile, selectedTab: $selectedTab)
        }
        .padding()
        .background(
            BlurView(style: .systemMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        )
        .padding(.horizontal,60)
        .padding(.bottom, 20)
        .ignoresSafeArea()
    }
}
