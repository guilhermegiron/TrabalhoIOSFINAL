//
//  ViewCoding.swift
//  final_project
//
//  Created by wellington martins on 26/06/23.
//

import Foundation

public protocol ViewCoding {
     func buildHierarchy()
     func buildConstrantis()
     
}

public extension ViewCoding {
     
     func setup() {
          buildHierarchy()
          buildConstrantis()
     }
     
}
