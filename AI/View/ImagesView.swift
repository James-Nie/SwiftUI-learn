//
//  ImagesView.swift
//  AI
//
//  Created by niejianbo on 2023/6/28.
//

import SwiftUI

struct ImagesList: View {
    var body: some View {
        Text("111")
    }
}

struct ImagesView: View {
    @State var query: String = ""
         
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 60)
            TextField("请输入图片名称", text: $query)
                //设置键盘类型
                .keyboardType(.phonePad)
                //设置对齐方式
                .multilineTextAlignment(.leading)
                //设置光标颜色，默认纯白色光标
                .accentColor(.purple)
                //输入字体颜色
                .foregroundColor(.black)
                //字体大小
                .font(.system(size: 14))
                //frame
                .frame(height:38)
                //padding
//                .padding(.horizontal, 26)
                //输入框风格
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color("EEEEEE"), width: 1)
                .cornerRadius(38)
//                .background(Color("EEEEEE"))
            
            Spacer()
        }.ignoresSafeArea().padding()
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
