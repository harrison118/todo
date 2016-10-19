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
    
    public static let sharedInstance = Lister()
    
    
    var items:[String]
    
    
    public init() {
        self.items = []
    }

    
public func clearList() {
    self.items.removeAll()
        
}
public func insert(newElement:String, atIndex : Int) throws {
    if (atIndex < 0) || (atIndex > (self.items.count -  1)){
        throw ListError.outOfRange(index : atIndex)
    }else {
        
        self.items.insert(newElement , at: atIndex)
    }
}
    
/** This is used to remove a specifc value from an indexed point */
    
public func remove(atIndex: Int) throws {
    
    if (atIndex < 0) || (atIndex > (self.items.count -  1)){
        throw ListError.outOfRange(index : atIndex)
    }
    else {
        self.items.remove(at:atIndex)
    }
}
    
    
    
/** 
 This will grab the item a specific index and then move it to another indexed point
 This will test to ensure that a value/data is not at that indexed point if is will swap?
 */
public func moveItem( fromIndex: Int, toIndex : Int) throws {
    if (fromIndex < 0) || (fromIndex > (self.items.count -  1)){
        throw ListError.outOfRange(index : fromIndex)
    }
    else  if (toIndex < 0) || (toIndex > (self.items.count -  1)){
        throw ListError.outOfRange(index : toIndex)
    } else {
        let tovalue = self.items[toIndex]
        self.items[fromIndex] = self.items[toIndex]
        self.items[fromIndex] = tovalue
    }
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
