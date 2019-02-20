//
//  postAlamofireVC.swift
//  CallingRestServices
//
//  Created by Esmeralda Angeles on 2/14/19.
//  Copyright © 2019 Sme.Angeles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class postAlamofireVC: UIViewController {
    
    @IBOutlet weak var postTableV: UITableView!
    
    
    var url: String = "https://www.proinversion.mx:2143/ImpulsaT/Oportunidades/ConsultarRendimientoNeto"
    var parameters = [String:Any]()
    var header: [String:String] = ["Authorization" : "Basic cndzcHJheGlzcDpQcjR4MXMjdTVS"]
    var arrRendimiento = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        
        parameters = ["rqt":
            ["fecha" : "2018-08-15", "edad" : 18]
        ]
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) in
            if responseData.result.isSuccess{
                let swiftyJson: JSON =  JSON(responseData.result.value!)
                
                if let arrDatos =  swiftyJson["rendimientoNeto"].arrayObject{
                    self.arrRendimiento = arrDatos as! [[String:AnyObject]]
                }
                
                if self.arrRendimiento.count > 0{
                    self.postTableV.reloadData()
                }
            }else{
                print("Error")
            }
        }
    }

}

extension  postAlamofireVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRendimiento.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "postAlamofireCell", for: indexPath)
            var positionArr = arrRendimiento[indexPath.row]
            print(positionArr)
            cell.textLabel?.text = positionArr["descripcionCorta"] as? String
            var rendimiento = positionArr["rendimientoNeto"]?.floatValue
            cell.detailTextLabel?.text = "\(rendimiento!)"
        return cell
    }

}
