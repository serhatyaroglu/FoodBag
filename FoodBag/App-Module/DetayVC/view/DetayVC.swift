// DetayVC.swift
//  FoodBag
//  Created by serhat yaroglu on 8.12.2021.
import UIKit
import Kingfisher
import Alamofire
var toplamfiyat = 0
class DetayVC: UIViewController {
    @IBOutlet weak var detayNameLabel: UILabel!
    @IBOutlet weak var detayImagePhoto: UIImageView!
    var yemekVeri:Yemekler?
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    @IBOutlet weak var yemekAdet: UILabel!
    var DetayPresenterNesnesi:ViewToPresenterDetayProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let yemek = yemekVeri{
            detayNameLabel.text = yemek.yemek_adi
                        detayImagePhoto.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"))
            yemekFiyatLabel.text = yemek.yemek_fiyat!
        }
        DetayRouter.createModule(ref: self)        // Do any additional setup after loading the view.
    }
    //burayi hic calistirmayacak
    @IBAction func SepeteEkle(_ sender: Any) {
        if (Int(yemekAdet.text!) == nil ){
            let alert = UIAlertController(title: "Lütfen Ürün Adeti Seçiniz", message: "", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
            }
            alert.addAction(iptalAction)
            self.present(alert, animated: true)
        }else{
            if let ya = detayNameLabel.text,let ysa = yemekFiyatLabel.text,let stepper = yemekAdet.text{
                DetayPresenterNesnesi?.Ekle(yemek_adi: ya, yemek_resim_adi: (yemekVeri?.yemek_resim_adi)!,yemek_fiyat: Int(ysa)!  , yemek_siparis_adet: Int(stepper)! , kullanici_adi: "serhatYaroglu")
            }
        }
    }
    //buradaki butona tiklanmadiysa
    @IBAction func YemekAdetButon(_ sender: UIStepper) {
        yemekAdet.text = "\(Int(sender.value))"
    }
    
}
