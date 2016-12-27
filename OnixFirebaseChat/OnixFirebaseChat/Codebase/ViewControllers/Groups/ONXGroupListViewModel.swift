//
//  ONXGroupListViewModel.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 07.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import Foundation
import RxSwift

struct ONXGroupListViewModel {
    var service: ONXFirebaseService

    func fetchItems()->Observable<[String]> {
        return Observable.create({ observer in
            observer.onNext([""])
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
