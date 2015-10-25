// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Categorias.swift instead.

import CoreData

public enum CategoriasAttributes: String {
    case nombre = "nombre"
}

public enum CategoriasRelationships: String {
    case peliculas = "peliculas"
}

@objc public
class _Categorias: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Categorias"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Categorias.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var nombre: String?

    // func validateNombre(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var peliculas: NSSet

}

extension _Categorias {

    func addPeliculas(objects: NSSet) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.peliculas = mutable.copy() as! NSSet
    }

    func removePeliculas(objects: NSSet) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.peliculas = mutable.copy() as! NSSet
    }

    func addPeliculasObject(value: Peliculas!) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.peliculas = mutable.copy() as! NSSet
    }

    func removePeliculasObject(value: Peliculas!) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.peliculas = mutable.copy() as! NSSet
    }

}

