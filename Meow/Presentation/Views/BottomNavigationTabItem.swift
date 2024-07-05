//
//  BottomNavigationTabItem.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/5.
//

import SwiftUI

struct BottomNavigationTabItem: View {
    var icon: String
    var title: String
    var tab: Tab
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button(action: {
            withAnimation{
                selectedTab = tab
            }
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(tab == selectedTab ? .white : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                // if selectedTab == tab {
                //     Text(title)
                //         .font(.system(size: 12))
                //         .foregroundColor(tab == selectedTab ? .white : .gray)
                //         .padding(.top,4)
                //         .transition(.opacity)
                // }
                
            }
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .foregroundColor(selectedTab == tab ? .blue : .gray)
        }
    }
}

//#Preview {
//    BottomNavigationTabItem(selectedTab: <#T##Binding<Tab>#>, icon: <#T##String#>, title: <#T##String#>, tab: <#T##Tab#>)
//}
