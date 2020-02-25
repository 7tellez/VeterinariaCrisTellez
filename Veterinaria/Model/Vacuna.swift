//
//  Vacuna.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/24/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import Foundation

class Vacuna {
   var id : Int?
    var nombre : String!
    var fecha : String!
    var dosis : String!
    var id_mascota : String!
    
        
        init( id: Int? = nil, nombre: String? = nil, fecha: String? = nil, dosis: String? = nil, id_mascota: String? = nil) {
            self.id = id
            self.nombre = nombre
            self.fecha = fecha
            self.dosis = dosis
            self.id_mascota = id_mascota

        }
}
