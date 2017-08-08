//
//  SCService.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import Moya

enum SCService {
    case getChannels
}

extension SCService: TargetType {
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: "https://gist.githubusercontent.com/reden87/ad856e7994b8ea93ac27503ecb051347/raw/050c539749f3d253a01ad685983ebc8503ea7872/example.json")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        return ""
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .getChannels:
            return .get
        }
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    /// The parameters to be encoded in the request.
    var parameters: [String : Any]? {
        return nil
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        switch self {
        case .getChannels:
            return "{}".utf8Encoded
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
}

private extension String {
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
