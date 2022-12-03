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
        collectionView.register(DailyTaskCell.self, forCellWithReuseIdentifier: DailyTaskCell.reuseIdentifier)
        collectionView.register(PromotionCell.self, forCellWithReuseIdentifier: PromotionCell.reuseIdentifier)
        collectionView.register(LessonCell.self, forCellWithReuseIdentifier: LessonCell.reuseIdentifier)
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
            case .dailyTasks(_):
                return self.createDailyTasksSection()
            case .promotions(_):
                return  self.createPromoSection()
            case .lessons(_):
                return  self.createLessonsSection()
            }
        }
    }
    
    
    private func createDailyTasksSection()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .fractionalHeight(2.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
       // section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
        
    }
    
    private func createPromoSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 5
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
        return section
        
    }
    
    private func createLessonsSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
       
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
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
            
        case .dailyTasks(let dailyTasks):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyTaskCell.reuseIdentifier, for: indexPath) as? DailyTaskCell else {
                return UICollectionViewCell()
            }           
            cell.setup(dailyTasks[indexPath.row])
            return cell
        case .promotions(let promotions):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCell.reuseIdentifier, for: indexPath) as? PromotionCell else {
                return UICollectionViewCell()
            }
            cell.setup(promotions[indexPath.row])
            return cell
        case .lessons(let lessons):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LessonCell.reuseIdentifier, for: indexPath) as? LessonCell else {
                return UICollectionViewCell()
            }
            cell.setup(lessons[indexPath.row])
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


struct DailyTaskItem {
    let title: String
    let description: String
    let progressCount: Int
    let totalCount: Int
   
}

struct PromoItem {
    let title: String
    let description: String
    let color: String
    let actionButtonTitle: String
}


struct LessonItem {
    let title: String
    let description: String
    let totalCount: Int
    let completed: Bool
}


enum ListSection {
    case dailyTasks([DailyTaskItem])
    case promotions([PromoItem])
    case lessons([LessonItem])
    
    var items: [Any] {
        switch self {
        case .dailyTasks(let items):
            return items
        case .promotions(let items):
            return items
        case .lessons(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
            
        case .dailyTasks:
            return "Daily tasks"
        case .promotions:
            return "promo"
        case .lessons(_):
            return "Lessons"
        }
    }
}

struct MockData {
    static let shared = MockData()
    
    
    private let dailyTasks: ListSection = {
        .dailyTasks([.init(title: "Level", description: "Intermediate", progressCount: 20, totalCount: 100 ),
                     .init(title: "Tasks", description: "Completed tasks", progressCount: 5, totalCount: 20 ),
                     .init(title: "Dayly goal", description: "Learning tasks", progressCount: 5, totalCount: 20 ),
                     .init(title: "Study days", description: "Your progress", progressCount: 25, totalCount: 62 ),])
    }()
    
    private let promotions: ListSection = {
        .promotions([.init(title: "", description: "", color: "", actionButtonTitle: "" ),
                     .init(title: "", description: "", color: "", actionButtonTitle: "" )])
    }()
    
    private let lessons: ListSection = {
        .lessons([.init(title: "Level", description: "Intermediate", totalCount: 20, completed: false ),
                  .init(title: "Level", description: "Intermediate", totalCount: 20, completed: false ),
                  .init(title: "Level", description: "Intermediate", totalCount: 20, completed: false ),
                  .init(title: "Level", description: "Intermediate", totalCount: 20, completed: false )])
    }()
    
    var pageData: [ListSection] {
        [dailyTasks, promotions, lessons]
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
