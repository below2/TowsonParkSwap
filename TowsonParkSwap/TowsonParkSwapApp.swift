//
//  TowsonParkSwapApp.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/22/22.
//

import SwiftUI
import RealmSwift

let app = App(id: "application-0-zxdjd")

@main
struct TowsonParkSwapApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Allows for date formatter in ReservationTimeView and ReservationConfirmation (moved here since it can't be declared twice even if it's in separate views)
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

// All those extracted subviews and struct/method type shit can be moved here to declutter some views, but not going to bother since it's easier to debug without moving them for the moment
