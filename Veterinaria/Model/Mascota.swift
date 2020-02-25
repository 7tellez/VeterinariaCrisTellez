//
//  Mascota.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/24/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import Foundation

class Mascota: Codable{
    var id: Int?
    var cedula: String?
    var nombre: String?
    var tipo: String?
    var edad: Int?
    var raza: String?
    var id_propietario: Int?
    
    init( id: Int, cedula: String, nombre: String, tipo: String, edad: Int, raza: String, id_propietario: Int) {
        self.id = id
        self.cedula = cedula
        self.nombre = nombre
        self.tipo = tipo
        self.edad = edad
        self.raza = raza
        self.id_propietario = id_propietario
    }
}

