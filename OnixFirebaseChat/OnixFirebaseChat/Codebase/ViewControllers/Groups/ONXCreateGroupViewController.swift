//
//  ONXCreateGroupViewController.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 07.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ONXCreateGroupViewController: UIViewController {

    public var viewModel: ONXCreateGroupViewModel!
    private let disposeBag = DisposeBag()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = "Create Group"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
