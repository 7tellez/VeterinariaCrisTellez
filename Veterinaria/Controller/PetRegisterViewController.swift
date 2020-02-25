//
//  PetRegisterViewController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class PetRegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var idPet: UITextField!
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var tablePet: UITableView!
    @IBOutlet weak var agePet: UITextField!
    @IBOutlet weak var tipePet: UITextField!
    @IBOutlet weak var tipoPet: UITextField!
    
    var dbPath = ""
     var fileName = "Veterinaria.sqlite3"
    var propietario = [Propietario]()
    var propietarioSeleccionado: Propietario?
    var propiedad = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                   .appendingPathComponent("Veterinaria.sqlite3")
        dbPath = fileURL.relativeString.replacingOccurrences(of: "file://", with: "")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PetRegisterViewController.dismissKeyboard))
                    view.addGestureRecognizer(tap)
        initTableView()
        obtenerPropietario()
    }
    @objc func dismissKeyboard(){
          view.endEditing(true)
    }
    func initTableView()
       {
           tablePet.delegate = self
           tablePet.dataSource = self
           tablePet.backgroundColor = UIColor.white

       }
    func obtenerPropietario(){
        self.propietario = BDController().obtenerPropietario(dbPath: dbPath)
        self.tablePet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(propietario.count)
        return propietario.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropietarioTableViewCell") as! PropietarioTableViewCell
        
        cell.setSell(historialVC: self, index: indexPath.row)
        cell.lable.text = propietario[indexPath.row].nombre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        propiedad = propietario[indexPath.row].id!
    }
    
        func  validar() -> Bool
    {
        if name.text == ""
        {
            Util.alerta(titulo: "Alerta", mensaje: "El Nombre esta vacio.", controller: self)
            return false
            
        }
        else if(idPet.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "El id esta vacio.", controller: self)
            return false
        }
        else if(tipoPet.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "El tipo esta vacio.", controller: self)
            return false
        }
        else if(tipePet.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "La raza esta vacio.", controller: self)
            return false
        }
        else if(agePet.text == "")
        {
            Util.alerta(titulo: "Alerta", mensaje: "edad esta vacio.", controller: self)
            return false
        }
        return true
    }

    @IBAction func search(_ sender: Any) {
    }
    @IBAction func registro(_ sender: Any) {
        if !validar(){return}
        
        if propiedad == nil || propiedad == 0{
            Util.alerta(titulo: "Alerta", mensaje: "Seleccione Propietario", controller: self)
            return
            
        }
        
        let nombre = name.text!
        let identify = idPet.text!
        let cedula = idPet.text!
        let tipo = tipoPet.text!
        let raza = tipePet.text!
        let edad = agePet.text!
        
        var ids = Int(identify)!
        var edads = Int(edad)!
        let detalleMascota = Mascota(id: ids, cedula: cedula, nombre: nombre, tipo: tipo, edad: edads, raza: raza, id_propietario: propiedad)
                
        BDController().agregarMascota(dbPath: dbPath, mascota: detalleMascota)
        
        dismiss(animated: true, completion: nil)
    }
    
}
