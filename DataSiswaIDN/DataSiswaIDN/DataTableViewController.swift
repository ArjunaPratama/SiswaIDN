//
//  DataTableViewController.swift
//  DataSiswaIDN
//
//  Created by Jun  on 11/16/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit
//
import SwiftyJSON
import Alamofire

var namaSelected:String?
var emailSelected:String?
var kelasSelected:String?
var alamatSelected:String?
var jenisSelected:String?
var telpSelected:String?


class DataTableViewController: UITableViewController {

    var nampungId : String = ""
    var arrayKategori = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("id + " + nampungId)
        
        let params = ["id_kategori" : nampungId]
        let url = "http://localhost/Siswa/index.php/api/getSiswaByIdKategori"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                //check response
                if response.result.isSuccess {
                    //kalau reponse sucsess kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get json array dari json diatas
                    self.arrayKategori = json["data"].arrayObject as! [[String:String]]
                    //check di log
                    // print(self.arrayBerita)
                    
                    //check jumlah array
                    if(self.arrayKategori.count > 0){
                        
                        //refresh tableView
                        self.tableView.reloadData()
                    }
                }
                else{
                    print("eror server")
                }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayKategori.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSiswa", for: indexPath) as! DataTableViewCell

        var serverid = arrayKategori[indexPath.row]
        
        var id = serverid["id_siswa"]
        let nama = serverid["Nama_Siswa"]
        let email = serverid["Email"]
        let kelas = serverid["Kelas"]
        //print(jdl)
        //var gambar = server["gambar"]
        
        //pindah
        cell.labelnama.text = nama
        cell.labelemail.text = email
        cell.labelkelas.text = kelas
        // Configure the cell..
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arrayKategori[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task["Nama_siswa"]
        //  gambarSelcetd = task["gambar"] as! String
        kelasSelected = task["Kelas"]
        emailSelected = task["Email"]
        telpSelected = task["No_telp"]
        jenisSelected = task["Jenis_Kelamin"]
        alamatSelected = task["Alamat"]
        
        
        
        
        
        
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "PassData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "PassData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                
                let value = arrayKategori[indexPath.row]
                controller.passnama = value["Nama_siswa"] as? String
                controller.passemail = value["Email"] as? String
                controller.passkelas = value["Kelas"] as? String
                controller.passkel = value["Jenis_Kelamin"] as? String
                controller.passalamat = value["Alamat"] as? String
                controller.passtelp = value["No_telp"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
