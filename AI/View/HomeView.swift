//
//  HomeView.swift
//  AI
//
//  Created by niejianbo on 2023/6/25.
//

import SwiftUI

struct Landmark: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var text: Text {
        Text(name).font(.system(size: 18, weight: .heavy))
    }
}

let cards1 = [
    Landmark(name: "扫一扫", imageName: "icon-scan"),
    Landmark(name: "健康码", imageName: "icon-code"),
    Landmark(name: "卡包", imageName: "icon-card"),
]

let cards2 = [
    Landmark(name: "公积金", imageName: "industry_icon_accumulationfund"),
    Landmark(name: "社保", imageName: "industry_icon_socialsecurity"),
    Landmark(name: "健康医保", imageName: "industry_icon_health"),
    Landmark(name: "行驶驾驶", imageName: "industry_icon_drive")
]
let cards3 = [
    Landmark(name: "教育就业", imageName: "industry_icon_education"),
    Landmark(name: "纳税缴费", imageName: "industry_icon_tax"),
    Landmark(name: "交通出行", imageName: "industry_icon_traffic"),
    Landmark(name: "全部", imageName: "industry_icon_apps")
]


struct Cards: View {
    let datas: Array<Landmark>
    let spacing: CGFloat
    var body: some View {
        HStack(
            spacing: spacing
        ) {
            ForEach(datas) { i in
                VStack() {
                    NavigationLink {
                        WebView(url: "https://www.apple.com.cn/")
                    } label: {
                        i.image
                    }
                    NavigationLink {
                        WebView(url: "https://www.apple.com.cn/")
                    } label: {
                        i.text
                    }
                }
            }
        }.ignoresSafeArea()
    }
}


struct HomeView: View {
    init() {
        print("hello init!")
        
    }
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                Group {
                    Cards(datas: cards1, spacing: 80)
                }.frame(width: 375, height: 334).background(Image("top-image"))
                Spacer().frame(height: 15)
                VStack() {
                    Spacer().frame(height: 10)
                    Cards(datas: cards2, spacing: 30)
                    Cards(datas: cards3, spacing: 30)
                    Spacer().frame(height: 10)
                }.background(.white).cornerRadius(10).padding(20)
                
                Spacer()
            }.ignoresSafeArea().background(Color("bg1")).padding(.all, 5)
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


