//
//  DaftarViewController.swift
//  DataSiswaIDN
//
//  Created by Jun  on 11/16/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit
//
import Alamofire
import SwiftyJSON

class DaftarViewController: UIViewController {

    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnDaftar(_ sender: Any) {
        
        //dekalrasi variable untuk mengambil nilai dari masing2 widget textfield
        let nilaiUser = etUsername.text
        let nilaiPassword = etPassword.text
        let nilaiEmail = etEmail.text


        //cek apakah nilai widget nya kosong
        if((nilaiUser?.isEmpty)! || (nilaiEmail?.isEmpty)! || (nilaiPassword?.isEmpty)!){

            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This is Required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)

        }else{
            //apbila widget tidek kosong
            //membuat parameter untuk disimpan ke database
            let params = ["Email" : nilaiEmail!, "password" : nilaiPassword, "username" : nilaiUser]
            //menecetak nilai params yang di kirim
            print(params)

            let url = "http://localhost/Siswa/index.php/api/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {(responseServer) in

                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    //muncul alert dialog
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil si simpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                }

            })

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
