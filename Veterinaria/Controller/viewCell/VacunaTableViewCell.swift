//
//  VacunaTableViewCell.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class VacunaTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var dosis: UILabel!
    
    var histoVC:RegistroVacunaViewController!
    var index:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func setSell(histoVC:RegistroVacunaViewController, index:Int)
    {
        self.histoVC = histoVC
        self.index = index
    }

}
  
