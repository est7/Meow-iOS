//
//  ProfileScreen.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import Lottie
import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: AnyViewModel<HomePageState, HomePageInput>
    var title: String = "Heart Button"
    
    var body: some View {
        ZStack {
            BackGradient()
            ProfileContent()
        }
    }
    
}

struct BackGradient: View {
    @State var t: Float = 0.0
    @State var timer: Timer?
    
    var body: some View {
        if #available(iOS 18.0, *) {
            MeshGradient(
                width: 3, height: 3,
                points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    [
                        sinInRange(-0.8...(-0.2), offset: 0.439, timeScale: 0.342, t: t),
                        sinInRange(0.3...0.7, offset: 3.42, timeScale: 0.984, t: t),
                    ],
                    [
                        sinInRange(0.1...0.8, offset: 0.239, timeScale: 0.084, t: t),
                        sinInRange(0.2...0.8, offset: 5.21, timeScale: 0.242, t: t),
                    ],
                    [
                        sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.084, t: t),
                        sinInRange(0.4...0.8, offset: 0.25, timeScale: 0.642, t: t),
                    ],
                    [
                        sinInRange(-0.8...0.0, offset: 1.439, timeScale: 0.442, t: t),
                        sinInRange(1.4...1.9, offset: 3.42, timeScale: 0.984, t: t),
                    ],
                    [
                        sinInRange(0.3...0.6, offset: 0.339, timeScale: 0.784, t: t),
                        sinInRange(1.0...1.2, offset: 1.22, timeScale: 0.772, t: t),
                    ],
                    [
                        sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.056, t: t),
                        sinInRange(1.3...1.7, offset: 0.47, timeScale: 0.342, t: t),
                    ],
                ],
                colors: [
                    .red, .purple, .indigo,
                    .orange, .white, .blue,
                    .yellow, .black, .mint,
                ]
            )
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    t += 0.02
                }
            }
            .background(.black)
            .ignoresSafeArea()
        } else {
            // Fallback on earlier versions
        }
    }
    
    func sinInRange(_ range: ClosedRange<Float>, offset: Float, timeScale: Float, t: Float) -> Float
    {
        let amplitude = (range.upperBound - range.lowerBound) / 2
        let midPoint = (range.upperBound + range.lowerBound) / 2
        return midPoint + amplitude * sin(timeScale * t + offset)
    }
}

struct ProfileContent: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello")
                .foregroundColor(.black)
                .font(.system(size: 20))
            
            ProfileParentView()
        }
    }
}

struct ProfileParentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Parent Count: \(count)")
            ProfileChildView(count: count)
            Button("Increment in Parent") {
                count += 1
            }
        }
    }
}

struct ProfileChildView: View {
    let count: Int
    
    var body: some View {
        VStack {
            Text("Child Count: \(count)")
            // 子视图无法修改 count 的值
        }
    }
}


#Preview {
    ProfileScreen(viewModel: AnyViewModel(HomeViewModel()))
}
