//
//  RxGlossableMoya.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import RxSwift
import Moya
import Gloss

public extension Response {
    
    public func mapArray<T: Gloss.Decodable>(_ type: T.Type, forKeyPath keyPath: String) throws -> [T] {
        guard
            let json = try mapJSON() as? NSDictionary,
            let nested = json.value(forKeyPath: keyPath) as? [JSON]
            else {
                throw MoyaError.jsonMapping(self)
        }
        
        if let models = [T].from(jsonArray: nested) {
            return models
        } else {
            throw MoyaError.jsonMapping(self)
        }
    }
}

public extension ObservableType where E == Response {
    
    public func mapArray<T: Gloss.Decodable>(type: T.Type, forKeyPath keyPath: String) -> Observable<[T]> {
        return flatMap { (response) -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self, forKeyPath: keyPath))
        }
    }
}
