//
//  FirstViewController.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var resTable: UITableView!
    var resList = [Res]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("first")
        loadJson()
        resTable.delegate = self
        resTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resCell", for: indexPath) as! ResTableViewCell
        
        cell.resImage.image = UIImage(named: resList[indexPath.row].image)
        cell.resName.text = resList[indexPath.row].name
        cell.resLocation.text = resList[indexPath.row].location
        cell.resCus.text = resList[indexPath.row].cuisines
        cell.resCost.text = resList[indexPath.row].averageCost
        cell.resHours.text = resList[indexPath.row].hours
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "resDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResDetailViewController {
            destination.res = resList[(resTable.indexPathForSelectedRow?.row)!]
        }
    }
    
    struct ResponseData: Decodable {
        var Res: [Res]
    }
    
    func loadJson(){
        
        print("loadJson")
        if let url = Bundle.main.url(forResource: "Restuarant", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
                print(jsonData.Res.count)
                resList = jsonData.Res
                
                DispatchQueue.main.async {
                    self.resTable.reloadData()
                }
                
            } catch {
                //print("error:\(error)")
            }
        }
       
    
    }


}

