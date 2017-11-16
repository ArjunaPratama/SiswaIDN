//
//  KategoriKelasTableViewController.swift
//  DataSiswaIDN
//
//  Created by Jun  on 11/16/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit
//
import Alamofire
import SwiftyJSON


class KategoriKelasTableViewController: UITableViewController {
    var arrKategori = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/Siswa/index.php/api/getKategori").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                //if json ["data"].arrayObject != nil {
                self.arrKategori = json["data"].arrayObject as! [[String:String]]
                
                if self.arrKategori.count > 0 {
                    self.tableView.reloadData()
                }
            }
            else{
                print("eror server")
            }
        }
    }

    override func didReceiveMemoryWarning(){
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
        return arrKategori.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKategori", for: indexPath) as! KategoriSiswaTableViewCell
        
        // Configure the cell...
        var serverid = arrKategori[indexPath.row]
        
        //printserver id
        var id = serverid["id_kategori"]
        let kategori = serverid["Kelas"]
        
        //pindahkan label
        cell.labelKategori.text = kategori
        
        return cell
    }
    //pindah ke label
    //dan melempar id kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //deklarasi idStoryBoard untuk pindah halaman
        let idStoryBoard = storyboard?.instantiateViewController(withIdentifier: "KelasKategori") as! DataTableViewController
        let id_kategori = arrKategori[indexPath.row]["id_kategori"]
        //variable untuk menampung id_kategori yang dilempar
        idStoryBoard.nampungId = id_kategori!
        
        show(idStoryBoard, sender: self)
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
