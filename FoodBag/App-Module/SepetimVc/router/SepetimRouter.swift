//
//  SepetimRouter.swift
//  FoodBag
//
//  Created by serhat yaroglu on 6.12.2021.
//

import Foundation
class SepetRouter : PresenterToRouterSepetProtocol {
   
    
    static func createModule(ref: SiparislerimVC) {
        let presenter : ViewToPresenterSepetProtocol & InteractorToPresenterSepetProtocol = SepetPresenter()
        //View controller için
        ref.SepetPresenterNesnesi = presenter
        //Presenter için
        ref.SepetPresenterNesnesi?.SepetInteractor = SepetInteractor()
        ref.SepetPresenterNesnesi?.SepetView = ref 
        //Interactor için
        ref.SepetPresenterNesnesi?.SepetInteractor?.SepetPresenter = presenter
    }
}
