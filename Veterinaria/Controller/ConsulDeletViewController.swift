//
//  ConsulDeletViewController.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/25/20.
//  Copyright © 2020 celuweb. All rights reserved.
//

import UIKit

class ConsulDeletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableDelete: UITableView!
    @IBOutlet weak var textSearch: UITextField!
    var dbPath = ""
    var fileName = "Veterinaria.sqlite3"
    var mascota = [Mascota]()

    override func viewDidLoad() {
        super.viewDidLoad()
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               .appendingPathComponent("Veterinaria.sqlite3")
    dbPath = fileURL.relativeString.replacingOccurrences(of: "file://", with: "")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ConsulDeletViewController.dismissKeyboard))
                    view.addGestureRecognizer(tap)
        initTableView()
        obtenerMascotas()
    }
    @objc func dismissKeyboard(){
          view.endEditing(true)
    }
    func initTableView()
    {
        tableDelete.delegate = self
        tableDelete.dataSource = self
        tableDelete.backgroundColor = UIColor.white

    }
    func obtenerMascotas(){
        self.mascota = BDController().obtenerMascota(dbPath: dbPath)
        self.tableDelete.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           print(mascota.count)
           return mascota.count
           
       }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                      let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteTableViewCell") as! DeleteTableViewCell
                      
                   cell.setSell(historialVC: self, index: indexPath.row)
                      cell.label.text = mascota[indexPath.row].nombre
                      return cell
                  }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           propiedad = mascota[indexPath.row].id!
        let alert = UIAlertController(title: "Eliminar Mascota", message: "¿Esta seguro que desea borrar \n la mascota de Base de Datos?", preferredStyle: .alert)
               
               alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action) in
                self.eliminar(nombre: self.mascota[indexPath.row].nombre!)
               }))
               
               alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
               
               self.present(alert, animated: true, completion: nil)
       }
    
        func eliminar(nombre: String){
            BDController().eliminarMascota(dbPath: dbPath, nombre: nombre)
            self.obtenerMascotas()
        }
    

    @IBAction func search(_ sender: Any) {
    }
 
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
