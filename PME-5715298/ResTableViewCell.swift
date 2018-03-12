//
//  ResTableViewCell.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import UIKit

class ResTableViewCell: UITableViewCell {

    
    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resLocation: UILabel!
    
    @IBOutlet weak var resCus: UILabel!
    @IBOutlet weak var resCost: UILabel!
    @IBOutlet weak var resHours: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
