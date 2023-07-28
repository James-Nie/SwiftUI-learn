//
//  LoginView.swift
//  AI
//
//  Created by niejianbo on 2023/6/28.
//

import SwiftUI

struct LoginView: View {
    func signIn() {
        
    }
    
    var body: some View {
        VStack(){
            Spacer()
                .frame(height: 200)
            Text("Welcom")
                .font(.system(size:50, design: .default))
                .foregroundColor(.white)
            Spacer()
            Button(action: signIn) {
                Text("登录")
            }
            .frame(width: 355, height: 40)
            .padding(10)
            .font(.title)
            .background(.green)
            .cornerRadius(40)
            .foregroundColor(.white)
            Spacer().frame(height: 30)
        }
        .ignoresSafeArea()
        .background(
            Image("login-bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
