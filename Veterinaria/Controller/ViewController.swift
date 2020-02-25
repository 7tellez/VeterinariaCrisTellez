//
//  ViewController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/24/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController{
    
    var db: OpaquePointer?
    var dbPath = ""


    override func viewDidLoad() {
        super.viewDidLoad()
 
        //the database file
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Veterinaria.sqlite3")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        //creating table
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Mascota ( id integer PRIMARY KEY NOT NULL, cedula varchar(128) DEFAULT('NOT NULL'), nombre varchar(128) DEFAULT('NOT NULL'),tipo integer(128) DEFAULT(NOT NULL), edad integer(128) DEFAULT(NOT NULL), raza varchar(128) DEFAULT('NOT NULL'),id_propietario integer(128) DEFAULT(NOT NULL), FOREIGN KEY (id_propietario) REFERENCES Propietario (Id));", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Propietario (Id integer PRIMARY KEY NOT NULL, telefono varchar(128) DEFAULT('NOT NULL'), nombre varchar(128) DEFAULT('NOT NULL'),cedula varchar(128) DEFAULT('NOT NULL'));", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Vacuna (id integer PRIMARY KEY NOT NULL, nombre varchar(128),fecha varchar(128), dosis varchar(128), id_mascota varchar(128),FOREIGN KEY (id_mascota) REFERENCES Mascota (id));", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
    }

    
    @IBAction func petRegister(_ sender: Any) {
        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "PetRegisterViewController") as! PetRegisterViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func consulta(_ sender: Any) {
        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "ConsulDeletViewController") as! ConsulDeletViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func vacuna(_ sender: Any) {
        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "RegistroVacunaViewController") as! RegistroVacunaViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func propieda(_ sender: Any) {
        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "PropiedadViewController") as! PropiedadViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func salir(_ sender: Any) {
        exit (0);
    }
}
