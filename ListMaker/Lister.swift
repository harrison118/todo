//
//  Lister.swift
//  ListMaker
//
//  Created by Harrison Stevens on 10/10/2016.
//  Copyright © 2016 Harrison Stevens. All rights reserved.
//

import Foundation

enum ListError: Error {
    case emptyString
    case duplicateItem
    case outOfRange( index: Int)
}



public class Lister {
    
    var items:[String]
    init() {
        self.items = []
    }

    
public func clearList() {
        
}
public func insert(newElement:String, at : Int) throws {
        
}
    
/** This is used to remove a specifc value from an indexed point */
    
public func remove(at: Int) throws {
        
}
    
/** 
 This will grab the item a specific index and then move it to another indexed point
 This will test to ensure that a value/data is not at that indexed point if is will swap?
 */
public func moveItem( fromIndex: Int, toIndex : Int) throws {
        
}




public func add(item: String){
    self.items.append(item)
}
    
    /** 
 Retrieves a list item from the specified index.
 
 let lister = lister() 
 let item = lister.getItem(atIndex :2)
 
 - paramter atindex : the list index to retrieve form 
 - Returns: the list item
 - throws: "ListError.outOfRange" if the index does not match a list item
 */

public func getItem(atIndex : Int) throws -> String {
    if (atIndex < 0) || (atIndex > (self.items.count -  1)){
        throw ListError.outOfRange(index : atIndex)
    }
    return self.items[atIndex]
    
}
    

    public var count:Int {
        get {
            return self.items.count
        }

}
}
