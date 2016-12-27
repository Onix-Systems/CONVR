//
//  ONXMoreNavigationController.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 06.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit

final class ONXMoreNavigationController: UINavigationController {

    private var firebaseService: ONXFirebaseService!

    init(service: ONXFirebaseService) {
        super.init(rootViewController: UIViewController())
        firebaseService = service
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

}
