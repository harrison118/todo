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
        
       self.notes.append(note)
        
    }
    
    public func getNote(atIndex: Int ) throws -> Note {
        if (atIndex < 0) || (atIndex > (self.notes.count -  1)){
            throw NoteError.outOfRange(Index : atIndex)
        }
        return self.notes[atIndex]
    }

   
    
    public func clearList() {
        
        self.notes.removeAll()
        
        
    }
    
    public func insert(note : Note, atIndex : Int ) throws {
        if (atIndex < 0) || ( atIndex > (self.notes.count)){
            throw NoteError.outOfRange(Index : atIndex)
        }else {
            
            self.notes.insert(note , at: atIndex)
        }
        
    }
    
    public func update(note : Note, atIndex : Int ) throws {
        if (atIndex < 0) || ( atIndex > (self.notes.count -  1)){
            throw NoteError.outOfRange(Index : atIndex)
        }else {
        self.notes[atIndex] = note
        
    }
    }
    
    public func remove(atIndex: Int ) throws {
        
        if (atIndex < 0) || (atIndex > (self.notes.count -  1)){
            throw NoteError.outOfRange(Index : atIndex)
        }
        else {
            self.notes.remove(at:atIndex)
        }
        
        
    }
    
    
    
    public var count : Int {
        
        get {
            return self.notes.count
        }
    }




}




