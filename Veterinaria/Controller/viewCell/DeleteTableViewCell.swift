//
//  DeleteTableViewCell.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class DeleteTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    var historialVC:ConsulDeletViewController!
       var index:Int!
       
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
           
       func setSell(historialVC:ConsulDeletViewController, index:Int)
       {
           self.historialVC = historialVC
           self.index = index
       }

}
