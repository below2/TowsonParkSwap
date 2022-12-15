//
//  FulfillmentList.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/14/22.
//

import Foundation

class FulfillmentList: ObservableObject {
    @Published var fulfillmentList = [Reservation]()
    
    
    func add(reservation: Reservation) {
        fulfillmentList.append(reservation)
    }
    
    /*func remove(reservation: Reservation) {
        if let index = reservationList.firstIndex(of: reservation) {
            reservationList.remove(at: index)
        }
    }*/
}
