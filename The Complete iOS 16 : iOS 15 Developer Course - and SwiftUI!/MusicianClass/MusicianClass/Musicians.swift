//
//  Musicians.swift
//  MusicianClass
//
//  Created by Patricio Calderon on 4/07/23.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
}

class Musicians {
    // Properties 
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    
    // In init you can write what you wanna do when an object is created. Works like a constructor
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("Nothing else matters")
    }
    
    private func test() {
        print("test")
    }
}
