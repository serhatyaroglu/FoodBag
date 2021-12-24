//
//  SepetimPresenter.swift
//  FoodBag
//
//  Created by serhat yaroglu on 6.12.2021.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
   
   
    
    
   
    
   
    
    var SepetInteractor: PresenterToInteractorSepetProtocol?
    var SepetView: PresenterToViewSepetProtocol?

    func YemekleriYukle() {
        SepetInteractor?.TumSepettekiYemekleriAl()
    }
    func sil(sepet_yemek_id: Int,kullanici_adi:String) {
        SepetInteractor?.YemekSil(sepet_yemek_id: sepet_yemek_id,kullanici_adi: kullanici_adi)
    }
    func Sepetisil(kullanici_adi:String) {
        SepetInteractor?.TumSepetiSil(kullanici_adi: kullanici_adi)

    }
    
    }

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemekListe: Array<Sepet_Yemekler>) {
        SepetView?.vieweVeriGonder(yemekListe: yemekListe)
    }
}
