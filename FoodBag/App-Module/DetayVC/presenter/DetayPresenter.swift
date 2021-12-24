//
//  DetayPresenter.swift
//  FoodBag
//
//  Created by serhat yaroglu on 6.12.2021.
//

import Foundation
class DetayPresenter : ViewToPresenterDetayProtocol {
  
    var DetayInteractor: PresenterToInteractorDetayProtocol?
    func Ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String) {
        DetayInteractor?.SepeteEkle(yemek_adi:yemek_adi,yemek_resim_adi:yemek_resim_adi,yemek_fiyat:yemek_fiyat,yemek_siparis_adet:yemek_siparis_adet,kullanici_adi:kullanici_adi)
        
    }
}

