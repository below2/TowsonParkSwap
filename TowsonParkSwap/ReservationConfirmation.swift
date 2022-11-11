//
//  ReservationConfirmation.swift
//  TowsonParkSwap
//
//  Created by user229386 on 11/2/22.
//

// There is a whole bunch of VStacks and HStacks in here to make the formatting correct
// TODO: extract subviews

import SwiftUI

struct ReservationConfirmation: View {
    var reservation: Reservation
    
    var body: some View {
        VStack {
            
            Spacer()
            // Title text
            Text("Reservation confirmation")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .offset(y: 40)
            Spacer()
            
            VStack {
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 15.0)
                        // Location text
                        Text("Location:")
                            .font(.title)
                        Spacer()
                        
                        // Location details pulled from Reservation object
                        VStack {
                            
                            Text(reservation.location.general)
                                .font(.title3)
                            if reservation.location.optionalSpecifier != "" {
                                Text(reservation.location.optionalSpecifier)
                                    .font(.title3)
                            }
                            Text(reservation.location.specifier)
                                .font(.title3)
                            
                        }
                        
                        Spacer()
                            .frame(width: 15.0)
                    }
                    
                    // Gray divider line
                    Divider()
                        .frame(width: 360.0)
                        .background(Color.gray)
                    Spacer()
                    
                    // Time details pulled from Reservation object
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        Text("Time:")
                            .font(.title)
                        Spacer()
                        Text("\(reservation.time.getFormattedDate(format: "MMMM d, h:mm a"))")
                            .font(.title3)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                            .frame(width: 15.0)
                    }
                    
                    // Gray divider line
                    Divider()
                        .frame(width: 360.0)
                        .background(Color.gray)
                    Spacer()
                    
                    // Payment details which can probably just remain like this since we don't need to implement any payment logic
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        Text("Payment:")
                            .font(.title)
                        Spacer()
                        Text("<payment>")
                            .font(.title)
                        Spacer()
                            .frame(width: 15.0)
                    }
                    
                    Divider()
                        .frame(width: 360.0)
                        .background(Color.gray)
                    Spacer()
                }
            }
            
            // Continue button
            Button(action: {print("continue")}) {
                Text("Continue")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350.0, height: 70)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
                    .offset(y: -20)
            }
        }
    }
}

// Instantiate Reservation object passed from ReservationTimeView
struct ReservationConfirmation_Previews: PreviewProvider {
    static let reservationPreview = Reservation(
        location: LocationSelection(
            general: "general",
            optionalSpecifier: "optionalSpecifier",
            specifier: "specifier"),
        time: Date())
    
    static var previews: some View {
        ReservationConfirmation(reservation: reservationPreview)
    }
}
