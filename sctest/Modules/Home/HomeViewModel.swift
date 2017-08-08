//
//  HomeViewModel.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import RxSwift

protocol HomeViewModelProtocol {
    var channels: Observable<[Channel]> { get }
}

final class HomeViewModel: HomeViewModelProtocol {
    
    let provider: DataProviding
    
    init(provider: DataProviding) {
        self.provider = provider
    }
    
    lazy var channels: Observable<[Channel]> = {
        return self.provider.channels
    }()
}
