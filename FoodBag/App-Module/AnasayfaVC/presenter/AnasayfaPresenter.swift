//
//  AnasayfaPresenter.swift
//  FoodBag
//
//  Created by serhat yaroglu on 6.12.2021.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func YemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
  
    
   
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(YemeklerListe: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(YemeklerListe: YemeklerListe)
    }
}
