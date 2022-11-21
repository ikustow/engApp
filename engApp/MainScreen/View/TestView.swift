//
//  TestView.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import UIKit

class TestView: UIView {
    
    var mainViewData: MainScreenViewData = .initial {
        didSet{
            setNeedsLayout()
        }
    }

    lazy var labelTitle = makeTitleLabel()
    lazy var activituIndicator = makeAcitivityIndicatorView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch mainViewData {
        case .initial:
            update(mainViewData: nil, isHidden: true)
        case .loading(let loading):
            update(mainViewData: loading, isHidden: false)
        case .success(let success):
            update(mainViewData: success, isHidden: false)
        case .failure(let failure):
            update(mainViewData: failure, isHidden: false)
        }
    }
    
    private func update(mainViewData: MainScreenViewData.MainScreenData?, isHidden: Bool){
        labelTitle.text = mainViewData?.title
        labelTitle.isHidden = isHidden
    }
}
