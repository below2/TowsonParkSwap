//
//  ReservationTimeView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI
import RealmSwift

struct ReservationTimeView: View {
    
    // Vars:
    @State private var currentDate = Date()
    // Declare LocationSelection object passed from ParkerView
    var locationSelection: LocationSelection
    //@StateObject var reservation = Reservation()
    var userProfile: Profile
    
    var body: some View {
        // Instantiate Reservation object to be passed to ReservationConfirmation
        let reservationTemp = ReservationTemp(
            location: locationSelection,
            time: currentDate)
        
        VStack {
            Spacer()
            
            // Grouped to avoid static view overflow
            Group {
                // Selection text
                Text("You selected: \n")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                // Location selection display
                Text(locationSelection.general)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                // Won't display optional specifier if it is empty
                if locationSelection.optionalSpecifier != "" {
                    Text(locationSelection.optionalSpecifier)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                }
                Text(locationSelection.specifier)
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            
            // Gray divider line
            Divider()
                .frame(width: 360.0)
                .background(Color.gray)
            
            Spacer()
            
            // Grouped to avoid static view overflow
            Group {
                // Reservation text
                Text("Select reservation time:")
                    .font(.largeTitle)
                
                // Date and time wheel picker
                DatePicker("", selection: $currentDate, in: timeRange, displayedComponents: [.date, .hourAndMinute]).labelsHidden().datePickerStyle(.wheel)
                
                // Selected time text
                Text("You've selected \(currentDate.getFormattedDate(format: "MMMM d, h:mm a"))")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            /*Button(action: {
             reservation.general = locationSelection.general
             reservation.optionalSpecifier = locationSelection.optionalSpecifier
             reservation.specifier = locationSelection.specifier
             reservation.time = currentDate
             }) {
             Text("click me")
             }*/
            // Continue button
            NavigationLink("Continue →", destination: ReservationConfirmation(reservationTemp: reservationTemp, userProfile: userProfile))
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 365.0, height: 60.0)
                .background(Color.yellow)
                .cornerRadius(10.0)
        }
    }
    //.environmentObject(reservation)
}

// Logic/calculations for time range displayed by DatePicker (15 min from current time -> 30 days from current time)
var timeRange: ClosedRange<Date> {
    let fifteenMin = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
    let thirtyDays = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
    return fifteenMin...thirtyDays
}

// Instantiate LocationSelection object passed from ParkerView
struct ReservationTimeView_Previews: PreviewProvider {
    static let locationSelectionPreview = LocationSelection(
        general: "general",
        optionalSpecifier: "optionalSpecifier",
        specifier: "specifier")
    
    static let userProfilePreview = Profile.empty
    
    static var previews: some View {
        ReservationTimeView(locationSelection: locationSelectionPreview, userProfile: userProfilePreview)
    }
}
