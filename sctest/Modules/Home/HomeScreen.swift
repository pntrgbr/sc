//
//  HomeViewController.swift
//  sctest
//
//  Created by Gabor Pinter on 2017. 08. 08..
//  Copyright © 2017. Gabor Pinter. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import INSElectronicProgramGuideLayout

class HomeScreen: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var epgCollectionView: UICollectionView!
    //@IBOutlet weak var collectionViewEPGLayout: INSElectronicProgramGuideLayout!

    var viewModel: HomeViewModelProtocol?
    var dataSource = RxCollectionViewSectionedReloadDataSource<Channel>()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        epgCollectionView.register(UINib(nibName: "FloatingCell", bundle: nil), forCellWithReuseIdentifier: "FloatingCellID")
        //collectionViewEPGLayout.dataSource = self
        //collectionViewEPGLayout.delegate = self
//        collectionViewEPGLayout.shouldResizeStickyHeaders = true
//        collectionViewEPGLayout.shouldUseFloatingItemOverlay = false
//        collectionViewEPGLayout.floatingItemOffsetFromSection = CGFloat(10)
//        collectionViewEPGLayout.currentTimeVerticalGridlineWidth = CGFloat(4)
//        collectionViewEPGLayout.sectionHeight = 60
//        collectionViewEPGLayout.sectionHeaderWidth = 110

        epgCollectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        dataSource.configureCell = { (_, cv, ip, i) in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "FloatingCellID", for: ip) as! FloatingCell
            cell.titleLabel.text = i.title
            cell.dateLabel.text = i.startDate
            return cell
        }
        
        viewModel?.channels
            .bind(to: epgCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}

extension HomeScreen: INSElectronicProgramGuideLayoutDelegate {


}
