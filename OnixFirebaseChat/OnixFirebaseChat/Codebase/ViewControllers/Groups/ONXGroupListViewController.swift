//
//  ONXGroupListViewController.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 07.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ONXGroupListViewController: UITableViewController {

    @IBOutlet weak var createGroupButton: UIButton!
    
    public var createGroupSubject:PublishSubject<Void>!
    public var viewModel: ONXGroupListViewModel!
    private let disposeBag = DisposeBag()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = "Groups"
        self.tabBarItem.image = UIImage(named: "groups")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = nil
        self.tableView.delegate = nil

        addBindingsToViewModel()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func addBindingsToViewModel() {
        //Fetch items from viewModel
        let fetchItems: (ONXGroupListViewModel?) -> Void = { viewModelSubject in
            viewModelSubject?.fetchItems()
                .bindTo(self.tableView.rx.items(cellIdentifier: "ONXGroupCell")) {
                    (index, item: String, cell) in
                }.addDisposableTo(self.disposeBag)
        }

        just(element: viewModel)
            .subscribe(onNext: fetchItems)
        .addDisposableTo(disposeBag)
        
        createGroupButton.rx.tap.asObservable()
        .bindTo(createGroupSubject)
        .addDisposableTo(disposeBag)
        
    }
}
