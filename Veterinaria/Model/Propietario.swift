//
//  Propietario.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/24/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import Foundation

class Propietario{
    
    var id : Int?
    var telefono : String?
    var nombre : String!
    var cedula : String?

       
       init( id: Int? = nil, telefono: String? = nil, nombre: String? = nil, cedula: String? = nil) {
           self.id = id
           self.cedula = cedula
           self.nombre = nombre
           self.telefono = telefono
       }
        
}
