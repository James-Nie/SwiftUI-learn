//
//  Request.swift
//  AI
//
//  Created by niejianbo on 2023/6/27.
//

import Foundation

class Request {
    //json转dic
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    func GET(url: String, params: Dictionary<String,String>) {
        // 构建URL
        var query = "";
        
        if !params.isEmpty {
            query = "?"
            for (key, value) in params {
                if query != "?" {
                    query = query + "&"
                }
                query = query + key + "=" + value
            }
        }
        
        let requestUrl:URL = URL(string: query.isEmpty ? url : url + query)!
        // 发送HTTP请求的的session对象
        let session = URLSession.shared
        // 构建请求request
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        // 发一个get请求
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.getDictionaryFromJSONString(jsonString: dataString!)
            print(dict)
        }
        task.resume()
    }
    
    func POST(url: String, jsonString: String) {
        // 这里直接使用 jsonString 转成字典，然后转成 Data，将 流 放到 request的 httpBody中， 模拟发送一个http请求
     
        let dict = self.getDictionaryFromJSONString(jsonString: jsonString)
        print(dict)
        var  jsonData = NSData()
        do {
             jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        // 构建URL
        let requestUrl:URL = URL(string: url)!
        // session
        let session = URLSession.shared
        // request
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        // 设置Content-Length，非必须
        request.setValue("\(jsonData.length)", forHTTPHeaderField: "Content-Length")
        // 设置 Content-Type 为 json 类型
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // POST    请求将 数据 放置到 请求体中
        request.httpBody = jsonData as Data
        // 发送请求
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in

            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            // 返回值 utf8 转码
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            // 将 jsonString 转成字典
            let dict = self.getDictionaryFromJSONString(jsonString: dataString!)
            print("POST result", dict)
        }
        task.resume()
    }
}
