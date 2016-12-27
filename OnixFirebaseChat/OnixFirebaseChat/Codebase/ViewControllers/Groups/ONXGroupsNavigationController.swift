//
//  ONXGroupsNavigationViewController.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 06.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit
import RxSwift

final class ONXGroupsNavigationController: UINavigationController {

    private static let storyBoard = UIStoryboard(storyboard: .Groups)
    private var firebaseService: ONXFirebaseService!
    private let disposeBag = DisposeBag()

    init(service: ONXFirebaseService) {
        let viewModel = ONXGroupListViewModel(service: service)
        let controller = ONXGroupsNavigationController.groupListViewController(with: viewModel)
        super.init(rootViewController: controller)
        firebaseService = service
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationAppearance()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = topViewController {
            return topViewController.preferredStatusBarStyle
        }
        return .lightContent
    }

    // MARK: ViewControllers

    static func groupListViewController(with viewModel: ONXGroupListViewModel) -> ONXGroupListViewController {
        let controller: ONXGroupListViewController = storyBoard.instantiateViewController()
        controller.viewModel = viewModel
        controller.createGroupSubject
            .subscribe(onNext: presentCreateGroupController)
        return controller
    }
    
    private static var presentCreateGroupController:()->() = {
        
    }
}

extension ONXGroupsNavigationController:ONXNavigationAppearance { }
