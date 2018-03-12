//
//  SecondViewController.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var resTable: UITableView!
    var resList = [Res]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        resTable.delegate = self
        resTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadBook()
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
    
    func loadBook(){
    
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        
        do {
            let ress =  try PersistenceService.context.fetch(fetchRequest)
            
            resList.removeAll()
            
            for r in ress {
               resList.append(Res(name: r.name!, location: r.location!, cuisines: r.cuisines!, averageCost: r.averageCost!, hours: r.hours!, rating: r.rating, image: r.image!, imageGallery: r.imageGallery!))
            }
            
            print("loaded book")
            print(ress.count)
            
            DispatchQueue.main.async {
                self.resTable.reloadData()
            }
            
        } catch {
            print("error load book")
        }
        
        
    }

}

