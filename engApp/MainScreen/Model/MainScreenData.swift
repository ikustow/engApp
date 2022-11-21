//
//  MainScreenData.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import Foundation

enum MainScreenViewData {
    case initial
    case loading(MainScreenData)
    case success(MainScreenData)
    case failure(MainScreenData)
    
    struct MainScreenData {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
