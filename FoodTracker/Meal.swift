//
//  Meal.swift
//  FoodTracker
//
//  Created by Sanjay Noronha on 2016/01/03.
//  Copyright © 2016 funza Academy. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCoding  {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Types
    
    struct PropertyKey {
        
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    //Next, you need a persistent path on the file system where data 
    //will be saved and loaded, so you know where to look for it.
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating

        // Because this i.e.
        // init?(name:photo:rating:), is a designated initializer, its implementation
        // needs to call to its superclass’s initializer.
        super.init()
        
        //Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    // MARK : NSCoding Impl
    func encodeWithCoder(aCoder: NSCoder)
    {
        //The encodeWithCoder(_:) method prepares the class’s
        //information to be archived
        
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    
    }
    
    required convenience init?(coder aDecoder: NSCoder) // NS_DESIGNATED_INITIALIZER
    {
        //implement the initializer to decode the encoded data.
        // The required keyword means this initializer must be
        // implemented on every subclass of the class that defines this initializer.
        
        // Convenience initializers are secondary, supporting initializers that need to call one of their class’s designated initializers. 
        
        //Designated initializers are the primary initializers for a class. They fully initialize all properties introduced by that class and call a superclass initializer to continue the initialization process up the superclass chain. 
        //Here, you’re declaring this initializer as a convenience initializer because it only applies when there’s saved data to be loaded.
        
        //The question mark (?) means that this is a failable initializer that might return nil.
        
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
        
    }
}
