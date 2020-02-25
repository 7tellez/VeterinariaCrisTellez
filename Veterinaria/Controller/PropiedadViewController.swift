//
//  PropiedadViewController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class PropiedadViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    var dbPath = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
       let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent("Veterinaria.sqlite3")
         dbPath = fileURL.relativeString.replacingOccurrences(of: "file://", with: "")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropiedadViewController.dismissKeyboard))
                    view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
          view.endEditing(true)
    }
    func  validar() -> Bool
    {
        if(id.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "El id esta vacio.", controller: self)
            return false
        }
        else if(name.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "El tipo esta vacio.", controller: self)
            return false
        }
        else if(phone.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "La raza esta vacio.", controller: self)
            return false
        }
        
        return true
    }
    

    

    @IBAction func registro(_ sender: Any) {
        if !validar(){return}
        
        let nombre2 = name.text!
        let phone2 = phone.text!
        let id2 = id.text!

        
        var ids = Int(id2)!
        let detallePropie = Propietario(id: ids, telefono: phone2, nombre: nombre2, cedula: id2)
       
        BDController().agregarPropietario(dbPath: dbPath, propio: detallePropie)
        
        dismiss(animated: true, completion: nil)
    }
}
