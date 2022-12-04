//
//  LessonCell.swift
//  engApp
//
//  Created by Ilya on 03.12.2022.
//

import UIKit

class LessonCell: UICollectionViewCell {
    static let reuseIdentifier = "lesson-cell-reuse-identifier"
    let label = UILabel()
    let descriptionLabel = UILabel()
    let lessonsRow = UILabel()
    var isCompleted = false
   

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension LessonCell {
    
    
    func setup(_ item: LessonItem) {
        label.text = item.title
        descriptionLabel.text = item.description
        lessonsRow.text = "\(item.totalCount) lessons"
        isCompleted = item.completed
        setupUI()
       }
    
    func configure() {
     
        label.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        lessonsRow.translatesAutoresizingMaskIntoConstraints = false
       
        contentView.addSubview(label)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(lessonsRow)




        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            lessonsRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lessonsRow.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            ])
    }
}

// MARK: - setup UI
extension LessonCell {
    
    func setupUI(){
        
        self.backgroundColor = .green
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.textColor = UIColor.gray
        
        lessonsRow.adjustsFontForContentSizeCategory = true
        lessonsRow.font = UIFont.preferredFont(forTextStyle: .body)
        
        layer.shadowColor = #colorLiteral(red: 0.5441147195, green: 1, blue: 0.5206287912, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 2
        
        layer.cornerRadius = 4
        if (isCompleted) {
            backgroundColor = #colorLiteral(red: 0.5441147195, green: 1, blue: 0.5206287912, alpha: 1)
           
        }
        else {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            layer.borderColor = #colorLiteral(red: 0.5441147195, green: 1, blue: 0.5206287912, alpha: 1)
            layer.borderWidth = 2
            layer.masksToBounds = true
        }
    }
}
