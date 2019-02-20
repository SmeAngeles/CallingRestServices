//
//  getAlamofireVC.swift
//  callingRestServices
//
//  Created by Esmeralda Angeles on 2/13/19.
//  Copyright © 2019 Sme.Angeles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class getAlamofireVC: UITableViewController {
    
    var arrContacts = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getAlaCell", for: indexPath)
        var contactInArr =  arrContacts[indexPath.row]
        cell.textLabel?.text = contactInArr["name"] as? String
        cell.detailTextLabel?.text =  contactInArr["email"] as? String
        return cell
    }
    
    func getData(){
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) in
            if responseData.result.isSuccess{
                let swiftyJson: JSON = JSON(responseData.result.value!)
                print(swiftyJson)
                
                
                if let arrData = swiftyJson["contacts"].arrayObject{
                    self.arrContacts =  arrData as! [[String:AnyObject]]
                }
                
                if self.arrContacts.count > 0{
                    self.tableView.reloadData()
                    
                }
    
            }else{
                let alert = UIAlertController(title: "Error", message: "Ocurrio un Error.Intentalo más tarde", preferredStyle: UIAlertController.Style.alert)
                let okErrorAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(okErrorAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}
