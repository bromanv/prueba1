//
//  Pelicula_Celda.swift
//  prueba1
//
//  Created by Byron Román on 10/24/15.
//  Copyright (c) 2015 bromanv. All rights reserved.
//

import Foundation
public class Pelicula_Celda: UITableViewCell
{
    @IBOutlet weak var lblPuntuacion: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    func show( data:Peliculas)
    {
        var filtro: NSPredicate = NSPredicate(format: "pelicula = %@ && habilitado == %@",data,NSNumber(bool: true)) ;
        
        lblCategoria.text = data.categoria!.nombre;
        lblNombre.text = data.nombre;
        var calificacionesFiltradas : NSSet =
        NSSet(set: data.calificaciones.filteredSetUsingPredicate(NSPredicate(format: "habilitado == %@",NSNumber(bool: true))));
        
        var cantidadCalificacion : Float = Float(calificacionesFiltradas.count );
        var sumaCalificacion : Float = calificacionesFiltradas.valueForKeyPath("@sum.calificacion") as! Float;
        if(cantidadCalificacion>0)
        {
            var calificacion = sumaCalificacion / cantidadCalificacion;
            lblPuntuacion.text = NSString(format: "%.2f", calificacion) as String;
            
        }
        else
        {
            lblPuntuacion.text = "0";
        }
        
    }
    
}