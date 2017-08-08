//
//  SwinjectStoryboard.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {

        defaultContainer.register(DataProviding.self) { _ in DataProvider() }
            .inObjectScope(.container)
        
        // MARK: - ViewModels
        defaultContainer.register(HomeViewModelProtocol.self) { r in
            HomeViewModel(provider: r.resolve(DataProviding.self)!)
        }

        // MARK: - Screens
        defaultContainer.storyboardInitCompleted(HomeScreen.self) { r, c in
            c.viewModel = r.resolve(HomeViewModelProtocol.self)!
        }
    }
}
