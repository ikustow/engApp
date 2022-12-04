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
    let progressView = UIStackView()
    static let reuseIdentifier = "text-cell-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }

}


// MARK: - service
extension DailyTaskCell {
    
    func setup(_ item: DailyTaskItem) {
        
        label.text = item.title
        descriptionTitle.text = item.description
        progressRow.text = "\(item.progressCount) / \(item.totalCount)"
        currentProgress = item.progressCount
        totalValue = item.totalCount
        createProgressView()
       }
    
    func createProgressView(){
        
        let avg = getAverageValue(current: currentProgress, total: totalValue)
        let completedColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        let uncompleteColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        progressView.axis  = NSLayoutConstraint.Axis.horizontal
        progressView.distribution  = UIStackView.Distribution.equalSpacing
        progressView.alignment = UIStackView.Alignment.center
        progressView.spacing = 4
          
        for item in 1...5 {
            if item <= avg {
                generateView(with: completedColor)
            } else {
                generateView(with: uncompleteColor)
            }
        }
    }
    
    func getAverageValue(current:Int, total:Int) -> Int {
        let avg = round(((Double(current) / Double(total)*10))/2)
        return Int(avg)
    }
    
 
    
    func configure() {
        setupCardUI()
        setupConstraints()
    }
}


// MARK: - setup UI
extension DailyTaskCell {
    
    func setupCardUI(){
        
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        progressRow.font = UIFont.preferredFont(forTextStyle: .subheadline)
        descriptionTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        descriptionTitle.textColor = UIColor.gray
        
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 1
        layer.cornerRadius = 2
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func generateView(with color: UIColor) {
        
        let imageView = UIView()
        imageView.backgroundColor = color
        imageView.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        imageView.layer.cornerRadius = 3
        imageView.layer.borderWidth = 0.5
        imageView.layer.masksToBounds = true
        
        imageView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        progressView.addArrangedSubview(imageView)
    }
}

// MARK: - setup Constraints
extension DailyTaskCell{
    func setupConstraints() {
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            ])
        
     
        contentView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
    
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
        
        contentView.addSubview(progressRow)
        progressRow.translatesAutoresizingMaskIntoConstraints = false
        progressRow.adjustsFontForContentSizeCategory = true


        NSLayoutConstraint.activate([
            progressRow.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            progressRow.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 24),
            ])
        
        contentView.addSubview(descriptionTitle)
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.adjustsFontForContentSizeCategory = true
       
        
        NSLayoutConstraint.activate([
            descriptionTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionTitle.topAnchor.constraint(equalTo: progressRow.bottomAnchor, constant: 8),
            ])
        
    }
}
