//
//  MoyaManager.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/28.
//  Copyright © 2019 niujf. All rights reserved.
//

import Foundation
import Moya
import Alamofire

/// 超时时长
private var requestTimeOut: Double = 15
///成功数据的回调
typealias successCallback = ((Any) -> (Void))
///失败的回调
typealias failedCallback = ((String) -> (Void))

/// endpointClosure用来构建Endpoint
private let myEndpointClosure = { (target: MoyaAPI) -> Endpoint in
    let url = target.baseURL.absoluteString + target.path
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
//    requestTimeOut = 15 //按照项目需求针对单个API设置不同的超时时长
    return endpoint
}

///网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

/// NetworkActivityPlugin插件用来监听网络请求
private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    debugPrint("networkPlugin \(changeType)")
    //targetType 是当前请求的基本信息
    switch(changeType){
    case .began:
        print("开始请求网络")
    case .ended:
        print("结束")
    }
}

////网络请求发送的核心初始化方法，创建网络请求对象
let Provider = MoyaProvider<MoyaAPI>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)


func NetworkRequest(_ target: MoyaAPI, completion: @escaping successCallback, failed:failedCallback?){
    Provider.request(target) { (result) in
        switch result {
            
        case let .success(response):
            do {
                //转JSON
                let responseObject = try JSONSerialization.jsonObject(with: response.data)
                guard let dic = responseObject as? Dictionary<String, Any>, let _ = String(data: response.data, encoding: String.Encoding.utf8) else {
                    debugPrint("什么情况?不是json数据?????")
                    return
                }
                completion(dic)
            } catch {
                
            }
        case let .failure(error):
             failed!(error.localizedDescription)
        }
    }
}
