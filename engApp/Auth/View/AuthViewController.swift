//
//  AuthViewController.swift
//  engApp
//
//  Created by Ilya on 16.11.2022.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }


}

// MARK: - SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) {
            
        }
    }
}
