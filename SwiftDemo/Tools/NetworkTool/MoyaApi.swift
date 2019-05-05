//
//  MoyaApi.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/28.
//  Copyright © 2019 niujf. All rights reserved.
//

import Foundation
import Moya

enum MoyaAPI {
    /********************登录模块****************/
    case register(account:String, password:String)//注册
}

extension MoyaAPI: TargetType {
    var baseURL: URL {
        return URL.init(string: Moya_BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .register:
            return LoginModule_Register
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register:
            return .post
//        default:
//            return .get
        }
    }
    
    ///这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
         return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case let .register(account, password):
            return .requestParameters(parameters: ["account":account, "password":password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
//        return ["Content-Type":"application/json"]
        return nil
    }
    
}
