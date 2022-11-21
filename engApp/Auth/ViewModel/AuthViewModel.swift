//
//  ViewModel.swift
//  engApp
//
//  Created by Ilya on 16.11.2022.
//

import Foundation

protocol AuthViewModelProtocol {
    var updateViewData: ((ViewData)->())?{get set}
    func startFetch()
}

final class AuthViewModel: AuthViewModelProtocol {
   public  var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
   public func startFetch() {
        // start loading
       updateViewData?(.loading(ViewData.Data(icon: nil, title: nil, description: nil, numberPhone: nil)))
       DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {[weak self] in
           self?.updateViewData?(.success(ViewData.Data(icon: nil, title: "sucsees", description: "ok", numberPhone: "asdasd")))
       })
    }
    
    
}
