//
//  Peliculas_VC.swift
//  prueba1
//
//  Created by Byron Román on 10/24/15.
//  Copyright (c) 2015 bromanv. All rights reserved.
//

import Foundation
public class Peliculas_VC :UITableViewController, UITableViewDataSource,UITableViewDelegate
{
    var peliculasMostrar:[Peliculas]=[];
    
    public override func viewDidLoad() {
        peliculasMostrar = Peliculas.MR_findAllSortedBy("fechaCreacion", ascending: true) as! [Peliculas];
        var a = peliculasMostrar.count;
        
    }
    public override func viewWillAppear(animated: Bool) {
        
    }
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            
            if(identifier == "detalle")
            {
                if let vc = segue.destinationViewController as? Pelicula_DetalleVC
                {
                    vc.pelicula = sender as? Peliculas;
                }
            }
            
            if identifier == "modal" {
            }
        }
        
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculasMostrar.count;
    }
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "peliculaCell", forIndexPath: indexPath) as! Pelicula_Celda;
        
        // Configure the cell...
        cell.show(peliculasMostrar[indexPath.row]);
        return cell
    }
    override public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            peliculasMostrar[indexPath.row].MR_deleteEntity();
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait();
            
            peliculasMostrar = Peliculas.MR_findAllSortedBy("fechaCreacion", ascending: true) as! [Peliculas];
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detalle", sender: peliculasMostrar[indexPath.row]);
    }
    
    @IBAction func openAdd(sender: AnyObject) {
        var modal :Pelicula_NuevaVC = self.storyboard!.instantiateViewControllerWithIdentifier("Pelicula_NuevaVC") as! Pelicula_NuevaVC;
        var formSheet :MZFormSheetController = MZFormSheetController(viewController: modal);
        formSheet.cornerRadius = 8.0;
        formSheet.portraitTopInset = 5.0;
        formSheet.landscapeTopInset = 10.0;
        formSheet.presentedFormSheetSize = CGSizeMake(self.tableView.frame.size.width-20,self.tableView.frame.size.height-40);
        formSheet.didDismissCompletionHandler = { (root) -> Void in
            self.peliculasMostrar = Peliculas.MR_findAllSortedBy("fechaCreacion", ascending: true) as! [Peliculas];
            self.tableView.reloadData();
        };
        self.mz_presentFormSheetController(formSheet, animated: true, completionHandler: { (root) -> Void in
            
        });
        
    }
    
}