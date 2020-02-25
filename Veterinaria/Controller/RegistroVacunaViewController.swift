//
//  RegistroVacunaViewController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class RegistroVacunaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dosis: UITextField!
    @IBOutlet weak var dateVacuna: UITextField!
    @IBOutlet weak var nameVacuna: UITextField!
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var VacunaTableView: UITableView!
    var dbPath = ""
    var fileName = "Veterinaria.sqlite3"
    var mascota = [Mascota]()
    var propiedad = 0
    var dueno = 0



    override func viewDidLoad() {
        super.viewDidLoad()
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               .appendingPathComponent("Veterinaria.sqlite3")
        dbPath = fileURL.relativeString.replacingOccurrences(of: "file://", with: "")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegistroVacunaViewController.dismissKeyboard))
                    view.addGestureRecognizer(tap)

        initTableView()
        obtenerMascotas()
    }
    @objc func dismissKeyboard(){
          view.endEditing(true)
    }
    func initTableView()
        {
            VacunaTableView.delegate = self
            VacunaTableView.dataSource = self
            VacunaTableView.backgroundColor = UIColor.white

        }
    func obtenerMascotas(){
        self.mascota = BDController().obtenerMascota(dbPath: dbPath)
        self.VacunaTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           print(mascota.count)
           return mascota.count
       }
           
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacunaTableViewCell") as! VacunaTableViewCell
        
        cell.setSell(histoVC: self, index: indexPath.row)
        cell.nombre.text = mascota[indexPath.row].nombre
         cell.fecha.text = mascota[indexPath.row].raza
         cell.dosis.text = mascota[indexPath.row].tipo

        return cell
    }
           
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        propiedad = mascota[indexPath.row].id!
        dueno = mascota[indexPath.row].id_propietario!
       }
    
    func  validar() -> Bool
     {
         if dosis.text == ""
         {
             Util.alerta(titulo: "Alerta", mensaje: "dosis esta vacio.", controller: self)
             return false
             
         }
         else if(nameVacuna.text == "")
         {
             Util.alerta(titulo: "Alerta", mensaje: "nombre esta vacio.", controller: self)
             return false
         }
         else if(dateVacuna.text == "")
         {
             Util.alerta(titulo: "Alerta", mensaje: "fecha esta vacio.", controller: self)
             return false
         }
         
         return true
     }
    



    @IBAction func resgitro(_ sender: Any) {
        if !validar(){return}
        
        if propiedad == nil || propiedad == 0 || dueno == nil || dueno == 0{
            Util.alerta(titulo: "Alerta", mensaje: "Seleccione Mascota", controller: self)
            return
        }
        let dosis2 = dosis.text!
        let name = nameVacuna.text!
        let date = dateVacuna.text!
              
        let detalleVacuna = Vacuna(id: propiedad, nombre: name, fecha: date, dosis: dosis2, id_mascota: String(dueno))
                
        BDController().agregarVacuna(dbPath: dbPath, vacuna: detalleVacuna)
        
        dismiss(animated: true, completion: nil)
                
    }
    @IBAction func search(_ sender: Any) {
    }
}
