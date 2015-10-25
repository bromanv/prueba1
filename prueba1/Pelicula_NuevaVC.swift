//
//  Pelicula_NuevaVC.swift
//  prueba1
//
//  Created by Byron Román on 10/24/15.
//  Copyright (c) 2015 bromanv. All rights reserved.
//

import Foundation
public class Pelicula_NuevaVC:UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate
{
    @IBOutlet weak var btnGuardar: UIButton!
    var peliculaNueva:Peliculas?;
    var context:NSManagedObjectContext?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var pvCategoria: UIPickerView!
    
    var pickerData:NSArray = [];
    
    public override func viewDidLoad() {
        context = NSManagedObjectContext.MR_context()
        pickerData = Categorias.MR_findAllSortedBy("nombre", ascending: true, inContext:context);
        peliculaNueva = Peliculas.MR_createEntityInContext(context);
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"));
        
        let recognizer1 = UITapGestureRecognizer(target: self, action:Selector("handleTap:"));
        recognizer1.delegate = self;
        self.view.addGestureRecognizer(recognizer);
        self.pvCategoria.addGestureRecognizer(recognizer1);
        self.peliculaNueva?.categoria = pickerData[0] as! Categorias;
        
    }
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return txtNombre.isFirstResponder() ;
    }
    public override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true);
        super.touchesBegan(touches, withEvent: event);
    }
    func handleTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    @IBAction func btnGuardar_TouchUpInside(sender: UIButton) {
        peliculaNueva?.fechaCreacion = NSDate();
        context?.MR_saveToPersistentStoreAndWait()
        btn_Close(sender);
    }
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
    
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    public
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pickerData.objectAtIndex(row) as! Categorias).nombre!;
    }
    public
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true);
        peliculaNueva!.categoria = pickerData[row] as? Categorias;
    }
    @IBAction func btn_Close(sender: AnyObject) {
        self.view.endEditing(true);
        self.mz_dismissFormSheetControllerAnimated(true, completionHandler: { (root) -> Void in
            
        })
    }
    
    public func textFieldDidEndEditing(textField: UITextField) {
        var nombre:String = txtNombre.text;
        if((!nombre.isEmpty ) && (count( nombre.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))>0))
        {
            if( !btnGuardar.enabled)
            {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    
                    self.btnGuardar.backgroundColor = UIColor.redColor();
                    self.btnGuardar.enabled = true;
                    
                })
            }
            
        }
        else
        {
            if( btnGuardar.enabled)
            {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    
                    self.btnGuardar.backgroundColor = UIColor.darkGrayColor();
                    self.btnGuardar.enabled = false;
                    
                })
            }
            
        }
        peliculaNueva!.nombre = nombre;
    }
}