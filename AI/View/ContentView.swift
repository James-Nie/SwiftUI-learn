//
//  HomeView.swift
//  AI
//
//  Created by niejianbo on 2023/6/25.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        // 检查是否可以进行生物特征认证
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 有可能，所以继续使用它
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 身份验证现已完成
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        self.isUnlocked = true
                        print("成功认证")
                    } else {
                        // there was a problem
                        self.isUnlocked = false
                        print("有个问题")
                    }
                }
            }
        } else {
            print("没有生物识别")
            // 没有生物识别
        }
    }
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                TabView{
                    HomeView().tabItem {
                        Label("首页", systemImage: "homekit")
                    }
                    AppsView().tabItem {
                        Label("服务", systemImage: "app")
                    }
                    CameraView().tabItem {
                        Label("照相", systemImage: "camera")
                    }
                    AccountView().tabItem {
                        Label("我的", systemImage: "person.fill")
                    }
                }
            } else {
                Text("人脸未通过，请登录")
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: authenticate)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
