//
//  ViewController.swift
//  DataSiswaIDN
//
//  Created by Jun  on 11/16/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelkelamin: UILabel!
    @IBOutlet weak var labelalamat: UILabel!
    @IBOutlet weak var labeltlp: UILabel!
    @IBOutlet weak var labelkelas: UILabel!
    @IBOutlet weak var labelnama: UILabel!
    @IBOutlet weak var labelemail: UILabel!
    
    var passnama:String?
    var passkelas:String?
    var passemail:String?
    var passalamat:String?
    var passtelp:String?
    var passkel:String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelnama.text = passnama!
        labelalamat.text = passalamat!
        labelkelas.text = passkelas!
        labeltlp.text = passtelp!
        labelkelamin.text = passkel!
        labelemail.text = passemail!
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

