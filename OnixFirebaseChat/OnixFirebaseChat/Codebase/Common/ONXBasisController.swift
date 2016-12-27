//
//  OnixFirebaseChat.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 02.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit
import RxSwift

final class ONXBasisController {

    private let firebaseService = ONXFirebaseService()
    private let disposeBag = DisposeBag()

    private var tabBarController: UITabBarController!

    init(window: UIWindow) {
        tabBarController = window.rootViewController as? UITabBarController
        tabBarController.view.backgroundColor = UIColor.white

        configure()
    }

    private func configure() {
        firebaseService.subject
            .subscribe(onNext: { (auth) in
                if let auth = auth,
                    let currentUser = auth.currentUser {
                    self.enterApp()
                } else {
                    self.logout()
                    self.presentAuthController()
                }
            }, onError: { (error) in
                print(error)
            })
            .addDisposableTo(disposeBag)
        firebaseService.configure()
    }

    func presentAuthController() {
        DispatchQueue.main.async {
            if let controller = self.firebaseService.signInViewController {
                self.tabBarController.present(controller, animated: true)
            }
        }
    }

    func enterApp() {
        tabBarController.viewControllers = [
            ONXChatsNavigationController(service:firebaseService),
            ONXGroupsNavigationController(service:firebaseService),
            ONXMoreNavigationController(service: firebaseService)
        ]
    }
    func logout() {
        tabBarController.viewControllers = []
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return firebaseService.application(open: url, options: options)
    }
}
