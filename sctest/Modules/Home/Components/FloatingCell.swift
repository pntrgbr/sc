//
//  FloatingCell.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import UIKit
import UIColor_MLPFlatColors

class FloatingCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var topBorderView: UIView!
    @IBOutlet weak var leftBorderView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        let randomColor = UIColor.randomFlatLight()
        topBorderView.backgroundColor = randomColor
        leftBorderView.backgroundColor = randomColor

        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true

        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
}
