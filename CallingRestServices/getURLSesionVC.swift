//
//  getURLSesionVC.swift
//  
//
//  Created by Esmeralda Angeles on 2/14/19.
//

import UIKit

class getURLSesionVC: UITableViewController {
    
    var urlService =  URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")
    var arrItems = [[String:AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        
        let session =  URLSession(configuration: .default)

        var request =  URLRequest(url: urlService!)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError{
                print("Error")
            }else if let jsonData = responseData{
                do{
                    
//                    var json: [String: Any] = try (JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any])!
//                    for key in json.keys{
//                        if key == "items"{
//                            self.arrItems = json[key] as! [[String : AnyObject]]
//                        }
//                    }
//                    var jsonResult: NSDictionary =  try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    

                }catch let e{
                    print(e)
                }
            }
        }
        dataTask.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getURLCell", for: indexPath)
        return cell
    }
    
    
}
