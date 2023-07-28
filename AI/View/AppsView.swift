//
//  AppsView.swift
//  AI
//
//  Created by niejianbo on 2023/6/25.
//

import SwiftUI

struct AppsView: View {
    @State private var importing = false
    
    init() {
        let url = "https://portal.zjzwfw.gov.cn/portal/athena/show"
        Request().GET(url: url, params: ["pageId": "12244"])
    }
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink("地图应用") {
                        MapView()
                    }
                    NavigationLink("网页应用") {
                        WebView(url: "https://www.apple.com.cn/")
                    }
                    Link("浏览器打开",
                          destination: URL(string: "https://www.apple.com.cn/")!)
                }
            }
            Button("选择文件") {
                importing = true
            }
            .frame(width: 355, height: 50)
            .background(Color(.blue))
            .cornerRadius(50)
            .foregroundColor(.white)
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [.plainText]
            ) { result in
                switch result {
                    case .success(let file):
                        print(file.absoluteString)
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
            Spacer().frame(height: 30)
        }
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}
