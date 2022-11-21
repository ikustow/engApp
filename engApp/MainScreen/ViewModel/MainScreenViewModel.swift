//
//  MainScreenViewModel.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import Foundation

protocol MainScreenViewModelProtocol {
    var updateMainScreenViewData: ((MainScreenViewData)->())?{get set}
    func startFetch()
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
   public  var updateMainScreenViewData: ((MainScreenViewData) -> ())?
    
    init() {
        updateMainScreenViewData?(.initial)
    }
    
   public func startFetch() {
        // start loading
       updateMainScreenViewData?(.loading(MainScreenViewData.MainScreenData(icon: nil, title: nil, description: nil, numberPhone: nil)))
       DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {[weak self] in
           self?.updateMainScreenViewData?(.success(MainScreenViewData.MainScreenData(icon: nil, title: "sucsees", description: "ok", numberPhone: "asdasd")))
       })
    }
    
    
}
