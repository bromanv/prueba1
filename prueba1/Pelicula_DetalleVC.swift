//
//  Pelicula_DetalleVC.swift
//  prueba1
//
//  Created by Byron Román on 10/24/15.
//  Copyright (c) 2015 bromanv. All rights reserved.
//
import Foundation
public class Pelicula_DetalleVC:UIViewController
{
    var pelicula:Peliculas?;
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblCantidadVecesCalificada: UILabel!
    @IBOutlet weak var lblCalificacion: UILabel!
    @IBOutlet weak var cfPuntos: HCSStarRatingView!
    public override func viewDidLoad() {
        if let peli = pelicula as Peliculas!
        {
            lblCategoria.text = peli.categoria!.nombre;
            lblNombre.text = peli.nombre;
            
            var calificacionesFiltradas : NSSet =
            NSSet(set: peli.calificaciones.filteredSetUsingPredicate(NSPredicate(format: "habilitado == %@",NSNumber(bool: true))));
            
            var cantidadCalificacion : Float = Float(calificacionesFiltradas.count );
            var sumaCalificacion : Float = calificacionesFiltradas.valueForKeyPath("@sum.calificacion") as! Float;
            if(cantidadCalificacion>0)
            {
                lblCantidadVecesCalificada.text = NSString(format: lblCantidadVecesCalificada.text!, Int(cantidadCalificacion).description) as String;
                
                var calificacion = sumaCalificacion / cantidadCalificacion;
                lblCalificacion.text = NSString(format: lblCalificacion.text!, calificacion) as String;
                
            }
            else
            {
                lblCantidadVecesCalificada.text = NSString(format: lblCantidadVecesCalificada.text!, "0") as String;
                lblCalificacion.text = NSString(format: lblCalificacion.text!, "0") as String;
            }
            
        }
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        if(cfPuntos.value>0)
        {
            var calificacion = Calificaciones.MR_createEntity();
            calificacion.calificacion = cfPuntos.value;
            calificacion.fechaCreacion = NSDate();
            calificacion.pelicula = pelicula;
            calificacion.habilitado = NSNumber(bool: true);
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait();
        }
    }
}