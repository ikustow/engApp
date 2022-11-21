//
//  MainScreenViewController.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//


import UIKit

class MainScreenViewController: UIViewController {
    
       
    private let sections = MockData.shared.pageData
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        //collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupCollectionView()
        setupConstraints()
    }
    
    private func setupCollectionView() {
       
      
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reuseIdentifier)
        view.addSubview(collectionView)
       
    }
    
    
    private func setupConstraints(){
       
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    //    private var viewModel: MainScreenViewModelProtocol!
    //    private var testView: TestView!
    //
    //    override func viewDidLoad() {
    //        viewModel = MainScreenViewModel()
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view.
    //        view.backgroundColor = .white
    //        createView()
    //    }
    //
    //    private func createView(){
    //        testView = TestView()
    //        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    //        testView.center = view.center
    //        view.addSubview(testView)
    //    }
    //
    //    private func updateView(){
    //        viewModel.updateMainScreenViewData = {[weak self] MainScreenViewData in
    //            self?.testView.mainViewData = MainScreenViewData
    //        }
    //    }
    
}

extension MainScreenViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
           
            guard let self = self else {return nil}
            let section = self.sections[sectionIndex]
            switch section{
            case .popular(_):
                return self.createPopularSection()
            case .comingSoon(_):
                return  self.createComingSoonSection()
            }
        }
    }
    
    
    private func createPopularSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 5
        section.contentInsets = .init(top: 0, leading: -10, bottom: 0, trailing: 0)
        return section
        
    }
    
    private func createComingSoonSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 5
        section.contentInsets = .init(top: 0, leading: -10, bottom: 0, trailing: 0)
        return section
        
    }
    
  
    
}


extension MainScreenViewController: UICollectionViewDelegate {
    
}

extension MainScreenViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
            
        case .popular(let popular):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifier, for: indexPath) as? TextCell else {
                return UICollectionViewCell()
            }           
            cell.setup(popular[indexPath.row])
            return cell
        case .comingSoon(let comingSoon):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell else {
                return UICollectionViewCell()
            }
            cell.setup(comingSoon[indexPath.row])
            return cell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind{
//        case UICollectionView.elementKindSectionHeader:
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
//            return header
//        default:
//            return UICollectionReusableView()
//        }
//    }
}



struct ListItem {
    let title: String
}

enum ListSection {
    case popular([ListItem])
    case comingSoon([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .popular(let items):
            return items
        case .comingSoon(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
            
        case .popular:
            return "Popular"
        case .comingSoon:
            return "Coming Soon"
        }
    }
}

struct MockData {
    static let shared = MockData()
    
       
    private let popular: ListSection = {
        .popular([.init(title: "Naruto"),
                  .init(title: "Jujutsu Kaisen"),
                  .init(title: "Demon Slayer"),
                  .init(title: "One Piece"),
                  .init(title: "Seven Deadly Sins")])
    }()
    
    private let comingSoon: ListSection = {
        .comingSoon([.init(title: "Tokyo Ghoul"),
                     .init(title: "Record of Ragnarok"),
                     .init(title: "Kaisen Returns"),
                     .init(title: "No Idea"),
                     .init(title: "Looks interesting")])
    }()
    
    var pageData: [ListSection] {
        [popular, comingSoon]
    }
}


// MARK: - SwiftUI
import SwiftUI

struct MainScreenViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainScreenViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainScreenViewControllerProvider.ContainerView>) -> MainScreenViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: MainScreenViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainScreenViewControllerProvider.ContainerView>) {
            
        }
    }
}
