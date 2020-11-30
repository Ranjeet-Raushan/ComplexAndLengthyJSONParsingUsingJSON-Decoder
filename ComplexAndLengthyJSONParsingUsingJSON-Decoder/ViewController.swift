//  ViewController.swift
//  ComplexAndLengthyJSONParsingUsingJSON-Decoder
//  Created by Ranjeet Raushan on 29/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var resultData : Result?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Mark: parse local complex json data
        guard let path = Bundle.main.path(forResource: "complex", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do{
            let jsonData = try Data(contentsOf: url)
            self.resultData = try JSONDecoder().decode(Result.self, from: jsonData)
            print("Result Data: \(resultData!)")
        }
        catch{
            print("Error:\(error)")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData?.items?.item?[0].batters?.batter?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ComplexTableView
        let  batterData = resultData?.items?.item?[0].batters?.batter?[indexPath.row]
        let  toppingData = resultData?.items?.item?[0].topping?[indexPath.row]
        cell.label_batter_id.text = "Batter ID : \(batterData?.id ?? "")"
        cell.label_batter_type.text = "Batter Type : \(batterData?.type ?? "")"
        
        cell.label_topping_id.text = "Topping ID : \(toppingData?.id ?? "")"
        cell.label_topping_type.text = "Topping Type : \(toppingData?.type ?? "")"
        
        return cell
    }
}
