//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Patricio Calderon on 10/07/23.
//

import Foundation

class SuperMusician : Musicians {
    
    func sing2() {
        print("enter night")
        
    }
    
    override func sing() {
        super.sing()
        print("exit light")
    }
    
}
