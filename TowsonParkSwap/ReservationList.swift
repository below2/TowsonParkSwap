//
//  ReservationList.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/12/22.
//

import Foundation

class ReservationList: ObservableObject {
    @Published var reservationList = [Reservation]()
    
    
    func add(reservation: Reservation) {
        reservationList.append(reservation)
    }
    
    func remove(reservation: Reservation) {
        if let index = reservationList.firstIndex(of: reservation) {
            reservationList.remove(at: index)
        }
    }
}

