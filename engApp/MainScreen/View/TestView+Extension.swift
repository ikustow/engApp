//
//  TestView+Extension.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import UIKit

extension TestView {
    
    
    func makeAcitivityIndicatorView() -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return activityIndicator
        
    }
    
    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLabel
    }
    
}
