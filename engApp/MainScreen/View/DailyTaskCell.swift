//
//  TextCell.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//import UIKit

import UIKit

class DailyTaskCell: UICollectionViewCell {
    let label = UILabel()
    let descriptionTitle = UILabel()
    let progressRow = UILabel()
    var currentProgress = 1
    var totalValue = 1
    let progressView = UIView()
    static let reuseIdentifier = "text-cell-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        createProgressView()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }

}

extension DailyTaskCell {
    
    func setup(_ item: DailyTaskItem) {
        label.text = item.title
        descriptionTitle.text = item.description
        progressRow.text = "\(item.progressCount) / \(item.totalCount)"
        currentProgress = item.progressCount
        totalValue = item.totalCount
       }
    
    func createProgressView(){
        
    }
    
    func configure() {
        self.backgroundColor = .systemBlue
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
          //  label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
            ])
        
        contentView.addSubview(progressRow)
        progressRow.translatesAutoresizingMaskIntoConstraints = false
        progressRow.adjustsFontForContentSizeCategory = true
        progressRow.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        NSLayoutConstraint.activate([
            progressRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            progressRow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            progressRow.topAnchor.constraint(equalTo: label.bottomAnchor, constant: inset),
           // progressRow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
            ])
        
        contentView.addSubview(descriptionTitle)
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.adjustsFontForContentSizeCategory = true
        descriptionTitle.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        NSLayoutConstraint.activate([
            descriptionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            descriptionTitle.topAnchor.constraint(equalTo: progressRow.bottomAnchor, constant: inset),
           // progressRow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
            ])
        
    }
}

