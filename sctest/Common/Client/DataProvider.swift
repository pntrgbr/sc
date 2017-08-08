//
//  DataProvider.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import Moya
import RxSwift

protocol DataProviding {
    var channels: Observable<[Channel]> { get }
}


final class DataProvider: DataProviding {

    private var service: RxMoyaProvider<SCService> = RxMoyaProvider<SCService>()


    lazy var channels: Observable<[Channel]> = {
        self.service.request(.getChannels)
            .filterSuccessfulStatusCodes()
            .mapArray(type: Channel.self, forKeyPath: "channels")
    }()
}
