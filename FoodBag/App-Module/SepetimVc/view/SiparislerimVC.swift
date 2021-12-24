//  SiparislerimVC.swift
//  FoodBag
//  Created by serhat yaroglu on 6.12.2021.
import UIKit
import Alamofire
import Kingfisher
var toplanan = 0
class SiparislerimVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toplamFiyatLabel: UILabel!
    var yemekListe = [Sepet_Yemekler]()
    
    var SepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        SepetRouter.createModule(ref: self)
       
        

    }
   
      
    override func viewWillAppear(_ animated: Bool) {
            SepetPresenterNesnesi?.YemekleriYukle()
        //self.toplamFiyatLabel.text = "\(toplanan)"
        toplam()

    //   toplamFiyatLabel.text = "\(toplamfiyat)"
    }
    func toplam(){
        var toplamVeri = 0
        var fiyat = 0
        for yemek in yemekListe{
            fiyat = Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!
            toplamVeri += fiyat
        }
        self.toplamFiyatLabel.text = String(toplamVeri)
        
    }
    @IBAction func SepetiTemizleButton(_ sender: Any) {
                    let alert = UIAlertController(title: "Sepettekileri silmek istedigine emin misin?", message: "Tum sepet silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.yemekListe.removeAll()
                self.tableView.reloadData()
                
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
    }
extension SiparislerimVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemekListe: Array<Sepet_Yemekler>) {
        self.yemekListe = yemekListe
        DispatchQueue.main.async {
            self.tableView.reloadData()
                self.toplam()
        }
    }
}
extension SiparislerimVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return yemekListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "SiparisHucre", for: indexPath) as! SiparisTableViewCell
        hucre.siparisAdi.text = "\(yemek.yemek_adi!)"
        hucre.label.text = "\(yemek.yemek_fiyat!) ₺"
        hucre.siparisAdetLabel.text = "\(yemek.yemek_siparis_adet!)"
       
        
        
        hucre.layer.shadowColor = UIColor.systemGray2.cgColor
        hucre.layer.shadowOffset = CGSize(width: 1, height: 1.2)
        hucre.layer.shadowRadius = 5.0
        hucre.layer.shadowOpacity = 0.7
        hucre.layer.masksToBounds = false
      //  var celltoplam = yemekListe[indexPath.row].yemek_fiyat
            //   toplanan = Int(celltoplam!)! + Int(celltoplam!)!
        
        hucre.siparisPhoto.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"))
        return hucre
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let yemek = self.yemekListe[indexPath.row]
            let alert = UIAlertController(title: "\(yemek.yemek_adi!) ", message: "Sepetten kaldırmak istediğinize emin misiniz ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                    self.SepetPresenterNesnesi?.sil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: "serhatYaroglu")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    }
