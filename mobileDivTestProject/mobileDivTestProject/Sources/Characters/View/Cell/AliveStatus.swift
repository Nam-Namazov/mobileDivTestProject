//
//  AliveStatus.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

enum AliveStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
    
    init(_ status: String) {
        switch status {
        case "Alive":
            self = .alive
        case "Dead":
            self = .dead
        default:
            self = .unknown
        }
    }
}
