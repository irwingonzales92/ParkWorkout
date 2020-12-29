//
//  AppCoordinator.swift
//  CalendarApp
//
//  Created by Irwin Gonzales on 12/27/20.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
    
    
    // API Call 
//    let apiClient: ApiClient = {
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = ["Content-Type": "application/json; charset=utf-8"]
//        let apiClient = ApiClient(configuration: configuration)
//        return apiClient
//    }()

    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    override func finish() {

    }

}
