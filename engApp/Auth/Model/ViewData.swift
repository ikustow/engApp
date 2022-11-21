//
//  ViewData.swift
//  engApp
//
//  Created by Ilya on 19.11.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
