//
//  methodMenu.swift
//  callingRestServices
//
//  Created by Esmeralda Angeles on 2/13/19.
//  Copyright © 2019 Sme.Angeles. All rights reserved.
//

import UIKit

class methodMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func acBtnGetAlamofire(_ sender: UIButton) {
        performSegue(withIdentifier: "showGetAlamofire", sender: nil)

    }
    
    
    @IBAction func acBtnPostAlamofire(_ sender: UIButton) {
        performSegue(withIdentifier: "showPostAlamofire", sender: nil)
    }
    
    @IBAction func acBtnGetURLSession(_ sender: Any) {
         performSegue(withIdentifier: "showGetURLSession", sender: nil)
    }
    

    @IBAction func acBtnPostURLSession(_ sender: UIButton) {
         performSegue(withIdentifier: "showPostURLSession", sender: nil)
    }
}
