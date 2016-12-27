//
//  ONXStoryboard.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 06.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit

protocol ONXStoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension ONXStoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController : ONXStoryboardIdentifiable { }

extension UIStoryboard {

    enum Storyboard: String {
        case Chats
        case Groups
        case Main
        case More
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }

    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }

    func instantiateViewController<T: ONXStoryboardIdentifiable>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}
