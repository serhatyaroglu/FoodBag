//
//  DetayRouter.swift
//  FoodBag
//
//  Created by serhat yaroglu on 6.12.2021.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.DetayPresenterNesnesi = DetayPresenter()
        ref.DetayPresenterNesnesi?.DetayInteractor = DetayInteractor()
    }
}
