//
//  BDController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import Foundation
import SQLite

class BDController {
    var db: Connection?
    
    func openDataBase(dbPath: String) -> Bool
    {
        do
        {
            db = try Connection(dbPath)
            return true
        }
        catch
        {
            return false
        }
    }
    func agregarMascota(dbPath: String, mascota: Mascota)
    {
        if(openDataBase(dbPath: dbPath))
        {
            do
            {
                let insertStatement = "INSERT INTO Mascota(id, cedula, nombre, tipo, edad, raza, id_propietario) VALUES ('\(mascota.id!)','\(mascota.cedula!)','\(mascota.nombre!)','\(mascota.tipo!)','\(mascota.edad!)','\(mascota.raza!)','\(mascota.id_propietario!)')"

                try db?.run(insertStatement)
                print("Mascota agregagada con exito")
            }
            catch{
                print("Mascota agregar error    ",error)

            }
        }
    }
    func agregarPropietario(dbPath: String, propio: Propietario)
    {
        if(openDataBase(dbPath: dbPath))
        {
            do
            {
                let insertStatement = "INSERT INTO Propietario(id, telefono, nombre, cedula) VALUES ('\(propio.id!)','\(propio.telefono!)','\(propio.nombre!)','\(propio.cedula!)')"

                try db?.run(insertStatement)
                print("Propietario agregagado con exito")
            }
            catch{
                print("Propietario agregar error    ",error)

            }
        }
    }
    func obtenerPropietario(dbPath: String) -> [Propietario]
    {
        var propietarios = [Propietario]()
        var propio: Propietario
        
        print(dbPath)
        
        if openDataBase(dbPath: dbPath)
        {
            do
            {
                for row in try (db?.prepare("SELECT * FROM Propietario"))!
                {
                    propio = Propietario(id: Int((row[0] as? Int64)!), telefono: row[1] as? String, nombre: row[2] as? String, cedula: row[3] as? String)
                   
                    propietarios.append(propio)
                }
            }catch{}
        }
        print(propietarios.count)
        return propietarios
    }
    
    func obtenerMascota(dbPath: String) -> [Mascota]
    {
        var propietarios = [Mascota]()
        var propio: Mascota
        
        print(dbPath)
        
        if openDataBase(dbPath: dbPath)
        {
            do
            {
                for row in try (db?.prepare("SELECT * FROM Mascota"))!
                {
                    propio = Mascota(id: Int((row[0] as? Int64)!), cedula: (row[1] as? String)!, nombre: (row[2] as? String)!, tipo: (row[3] as? String)!, edad: Int((row[4] as? Int64)!), raza: (row[5] as? String)!, id_propietario: Int((row[6] as? Int64)!))

                   
                    propietarios.append(propio)
                }
            }catch{}
        }
        print(propietarios.count)
        return propietarios
    }
    
    func eliminarMascota(dbPath: String, nombre: String)
    {
        if(openDataBase(dbPath: dbPath))
        {
            do
            {
                let insertStatement = "DELETE FROM Mascota WHERE nombre ='\(nombre)'"
                
                try db?.run(insertStatement)
                print("MASCOTA ELIMINADA")
            }
            catch{}
        }
    }
    func agregarVacuna(dbPath: String, vacuna: Vacuna)
    {
        if(openDataBase(dbPath: dbPath))
        {
            do
            {
                let insertStatement = "INSERT INTO Vacuna(id, nombre, fecha, dosis, id_mascota) VALUES ('\(vacuna.id)','\(vacuna.nombre)','\(vacuna.fecha)','\(vacuna.dosis)','\(vacuna.id_mascota)')"

                try db?.run(insertStatement)
                print("Mascota agregagada con exito")
            }
            catch{
                print("Mascota agregar error    ",error)

            }
        }
    }
    
}
