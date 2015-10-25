// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Peliculas.swift instead.

import CoreData

public enum PeliculasAttributes: String {
    case fechaCreacion = "fechaCreacion"
    case nombre = "nombre"
}

public enum PeliculasRelationships: String {
    case calificaciones = "calificaciones"
    case categoria = "categoria"
}

@objc public
class _Peliculas: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Peliculas"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Peliculas.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var fechaCreacion: NSDate?

    // func validateFechaCreacion(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var nombre: String?

    // func validateNombre(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var calificaciones: NSSet

    @NSManaged public
    var categoria: Categorias?

    // func validateCategoria(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

extension _Peliculas {

    func addCalificaciones(objects: NSSet) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func removeCalificaciones(objects: NSSet) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func addCalificacionesObject(value: Calificaciones!) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func removeCalificacionesObject(value: Calificaciones!) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.calificaciones = mutable.copy() as! NSSet
    }

}

