//
//  ONXAppearance.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 07.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit

protocol ONXNavigationAppearance {
    func configureNavigationAppearance()
}

extension ONXNavigationAppearance where Self:UINavigationController {

    func configureNavigationAppearance() {
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = UIColor(named:.Azure)
        navigationBar.isTranslucent = false
    }
}
