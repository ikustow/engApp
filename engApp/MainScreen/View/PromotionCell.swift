//
//  ListCell.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import UIKit

class PromotionCell: UICollectionViewCell {
   
    static let reuseIdentifier = "list-cell-reuse-identifier"
    let label = UILabel()
    let descriptionLabel = UILabel()
    let actionButtonTitle = UILabel()
    let actionButton = UIButton(type: .system)
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension PromotionCell {
    
    
    func setup(_ item: PromoItem) {
        label.text = item.title
        descriptionLabel.text = item.description
        actionButtonTitle.text = item.actionButtonTitle
        backgroundColor = UIColor(named: item.color)
        let colorValue = item.color
        createActionButton(withTitle: item.actionButtonTitle, andColor: colorValue)
       }
    
    func configure() {
        setupUI()
        setupConstraints()
  
    }
}

// MARK: - setup UI
extension PromotionCell {
   
    func createActionButton(withTitle titleValue: String, andColor color: String){
        
        actionButton.setTitle(actionButtonTitle.text, for: .normal)
        actionButton.setTitleColor(UIColor(named: color), for: .normal)
        actionButton.backgroundColor = .white
        actionButton.layer.cornerRadius = 3
        actionButton.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
    }
    
    func setupUI(){
      
        let color = self.backgroundColor?.cgColor
        layer.masksToBounds = false
        layer.shadowColor = color
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 1
        layer.cornerRadius = 2
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        label.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        actionButtonTitle.font = UIFont.preferredFont(forTextStyle: .body)
    }
}



// MARK: - setup Constraints
extension PromotionCell {
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.adjustsFontForContentSizeCategory = true
        actionButton.translatesAutoresizingMaskIntoConstraints = false
      
       
        contentView.addSubview(label)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(actionButton)


        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            ])
    }
}
