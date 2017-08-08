//
//  Model.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import Gloss
import RxDataSources

struct Channel: Decodable {
    var id: UInt64
    var title: String
    var items: [Programme]
    
    init?(json: JSON) {
        guard
            let id: UInt64 = "id" <~~ json,
            let title: String = "title" <~~ json
            else { return nil }
        
        self.id = id
        self.title = title
        self.items = "programme" <~~ json ?? []
    }
}

struct Programme: Decodable {
    var title: String
    var endDate: String
    var startDate: String
    
    init?(json: JSON) {
        guard
            let title: String = "title" <~~ json,
            let startDate: String = "start_date" <~~ json,
            let endDate: String = "end_date" <~~ json
            else { return nil }
        
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}


extension Channel: SectionModelType {
    typealias Item = Programme

    init(original: Channel, items: [Programme]) {
        self = original
        self.items = items
    }
}
