//
//  Notes.swift
//  Note-It
//
//  Created by Harrison Stevens on 25/10/2016.
//  Copyright © 2016 Harrison Stevens. All rights reserved.
//

import Foundation

enum NoteError : Error {
    case emptyNote
    case DuplicateNote
    case outOfRange ( Index: Int)
    
}

//Becuase we have set note to hold two different strings, we have defined a struct to hold the note, A struct defines a physically grouped list of variables to be placed, under one name in a block of memory allowing different variable to be accesed via a single pointer
struct Note {
    var title:String
    var text :String
    
}

//Here we have defined an array of the data type struct 
class Notes {
    
    public static let sharedInstance = Notes()
    
    
    var notes:[Note]
    
   
    
    
    
    init() {
        self.notes = []
    }

    public func add(note:Note) throws {
        
    }
    
    public func getNote(atIndex index: Int ) throws -> Note {
        return Note(title:"Hello", text : "World")
    }

    public var count : Int {
        
        get {
            return 0
        }
    }
    
    public func clearList() {
        
        
    }
    
    public func insert(note : Note, at index : Int ) throws {
        
        
    }
    
    public func update(note : Note, at index : Int ) throws {
        
        
    }
    
    public func remove(at index: Int ) throws {
        
        
    }
    
    
    
    




}




