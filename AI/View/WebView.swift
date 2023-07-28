//
//  WebView.swift
//  AI
//
//  Created by niejianbo on 2023/6/27.
//

import SwiftUI
import WebKit

struct SWKWebView: UIViewRepresentable {
    
    @Binding var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url, let requetURL = URL(string: url)  {
            uiView.load(URLRequest(url: requetURL))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
        
    class Coordinator: NSObject,WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { (result, error) in
                print("didFinish:\(String(describing: result ?? ""))")
            }
        }
    }
}

// 显示webview的页面
struct WebView:View {
    @State var url: String? = ""
    var body: some View {
        if url != nil {
            SWKWebView(url: $url)
        } else {
            Text("请传参需要显示的页面url")
        }
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.apple.com.cn/")
    }
}
