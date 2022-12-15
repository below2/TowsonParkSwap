//
//  Reservation.swift
//  TowsonParkSwap
//
//  Created by user229386 on 11/9/22.
//

import Foundation

class Reservation: ObservableObject, Identifiable, Equatable {
    static func == (lhs: Reservation, rhs: Reservation) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    @Published var id = UUID()
    @Published var general = "general"
    @Published var optionalSpecifier = "optionalSpecifier"
    @Published var specifier = "specifier"
    @Published var time = Date()
}

// Reservation object (property), comparable to an abstract class in Java
/*struct Reservation {
    var location: LocationSelection
    var time: Date
}*/
