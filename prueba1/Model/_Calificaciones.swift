// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Calificaciones.swift instead.

import CoreData

public enum CalificacionesAttributes: String {
    case calificacion = "calificacion"
    case fechaCreacion = "fechaCreacion"
    case habilitado = "habilitado"
}

public enum CalificacionesRelationships: String {
    case pelicula = "pelicula"
}

@objc public
class _Calificaciones: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Calificaciones"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Calificaciones.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var calificacion: NSNumber?

    // func validateCalificacion(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var fechaCreacion: NSDate?

    // func validateFechaCreacion(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var habilitado: NSNumber?

    // func validateHabilitado(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var pelicula: Peliculas?

    // func validatePelicula(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

