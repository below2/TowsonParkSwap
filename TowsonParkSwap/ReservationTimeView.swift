//
//  ReservationTimeView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI

// I found like all the clock shit online so unsure how it works entirely, but it lets the user select a time between 15 min from now to 30 days from now
//
struct ReservationTimeView: View {
    @State private var currentDate = Date()
    
    var body: some View {
        VStack {
            Spacer()
            
            // Selection text
            Text("You selected:")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            // TODO: change this so it actually displays selection made in ParkerView
            Text("<insert location>")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            // Gray divider line
            Divider().frame(width: 360.0).background(Color.gray)
            
            Spacer()
            
            // Reservation text
            Text("Select reservation time:")
                .font(.largeTitle)
            
            // Date and time wheel picker
            DatePicker("", selection: $currentDate, in: thirtyDays, displayedComponents: [.date, .hourAndMinute]).labelsHidden().datePickerStyle(.wheel)
            
            // Selected time text
            Text("You've selected \(currentDate)")
                .multilineTextAlignment(.center)
                .padding()
            
            // Continue button
            Button(action: {print("continue")}) {
                Text("Continue")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 280.0, height: 100)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
            }
        }
    }
}

var thirtyDays: ClosedRange<Date> {
  let today = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
  let thirty = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
  return today...thirty
}

struct ReservationTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationTimeView()
    }
}
