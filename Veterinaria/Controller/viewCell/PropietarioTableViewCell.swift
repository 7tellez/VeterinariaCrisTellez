//
//  PropietarioTableViewCell.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class PropietarioTableViewCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    
    var historialVC:PetRegisterViewController!
    var index:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func setSell(historialVC:PetRegisterViewController, index:Int)
    {
        self.historialVC = historialVC
        self.index = index
    }

}
