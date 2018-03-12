//
//  ResDetailViewController.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import UIKit

class ResDetailViewController: UIViewController {

    var res: Res?
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resLocation: UILabel!
    @IBOutlet weak var resTime: UILabel!
    @IBOutlet weak var resCus: UILabel!
    @IBOutlet weak var resRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = res?.name
        resName.text = res?.name
        resLocation.text = res?.location
        resTime.text = res?.hours
        resCus.text = res?.cuisines
        resRating.text = String(format:"%.1f",(res?.rating)!)
        
        var c = 0
        for i in (res?.imageGallery)!{
            let imageView = UIImageView()
            imageView.image = UIImage(named: i)
            imageView.contentMode = .scaleToFill
            
            let xPos = Int(self.view.frame.width) * c
            imageView.frame = CGRect(x: CGFloat(xPos), y: 0, width: self.imageScrollView.frame.width, height: self.imageScrollView.frame.height)
            
            imageScrollView.contentSize.width = imageScrollView.frame.width * CGFloat(c + 1)
            imageScrollView.addSubview(imageView)
            
            c+=1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickBookmark(_ sender: UIButton) {
        let bres = Restaurant(context: PersistenceService.context)
        bres.name = res?.name
        bres.location = res?.location
        bres.cuisines = res?.cuisines
        bres.averageCost = res?.averageCost
        bres.hours = res?.hours
        bres.rating = (res?.rating)!
        bres.image = res?.image
        bres.imageGallery = res?.imageGallery
                
        PersistenceService.saveContext()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
