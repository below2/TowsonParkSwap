//
//  AvailableList.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/14/22.
//

import Foundation

class AvailableList: ObservableObject {
    @Published var availableList = [Reservation]()
    
    
    func add(reservation: Reservation) {
        availableList.append(reservation)
    }
    
    func remove(reservation: Reservation) {
        if let index = availableList.firstIndex(of: reservation) {
            availableList.remove(at: index)
        }
    }
}
