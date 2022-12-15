//
//  ReservationConfirmation.swift
//  TowsonParkSwap
//
//  Created by user229386 on 11/2/22.
//

// There is a whole bunch of VStacks and HStacks in here to make the formatting correct
// TODO: extract subviews

import SwiftUI
import RealmSwift

struct ReservationConfirmation: View {
    var reservationTemp: ReservationTemp
    //@StateObject var reservation = Reservation()
    //@EnvironmentObject var reservation: Reservation
    //@StateObject var reservationList = ReservationList()
    //@EnvironmentObject var reservation: Reservation
    @EnvironmentObject var reservationList: ReservationList
    @EnvironmentObject var availableList: AvailableList
    
    @State var isConfirmed: Bool = false
    
    var userProfile: Profile
    
    var body: some View {
        var reservation = Reservation()
        //NavigationStack {
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
                            
                            Text(reservationTemp.location.general)
                                .font(.title3)
                            if reservationTemp.location.optionalSpecifier != "" {
                                Text(reservationTemp.location.optionalSpecifier)
                                    .font(.title3)
                            }
                            Text(reservationTemp.location.specifier)
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
                        Text("\(reservationTemp.time.getFormattedDate(format: "MMMM d, h:mm a"))")
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
            
            if (isConfirmed == false) {
                // Continue button
                Button(action: {
                    reservation.id = UUID()
                    reservation.general = reservationTemp.location.general
                    reservation.optionalSpecifier = reservationTemp.location.optionalSpecifier
                    reservation.specifier = reservationTemp.location.specifier
                    reservation.time = reservationTemp.time
                    
                    reservationList.add(reservation: reservation)
                    availableList.add(reservation: reservation)
                    
                    isConfirmed.toggle()
                }) {
                    Text("Confirm")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 360.0, height: 80)
                        .background(Color.yellow)
                        .cornerRadius(15.0)
                        .offset(y: -20)
                }
            }
            if (isConfirmed) {
                NavigationLink("Continue →", destination: ProfileView(userProfile: userProfile))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 365.0, height: 80)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
                    .offset(y: -20)
            }
        }
    }
    //.environmentObject(reservation)
    //.environmentObject(reservationList)
}
//}

// Instantiate Reservation object passed from ReservationTimeView
struct ReservationConfirmation_Previews: PreviewProvider {
    //ReservationConfirmation().environmentObject(Reservation())
    static let reservationPreview = ReservationTemp(
        location: LocationSelection(
            general: "general",
            optionalSpecifier: "optionalSpecifier",
            specifier: "specifier"),
        time: Date())
    
    static let userProfilePreview = Profile.empty
    
    static var previews: some View {
        ReservationConfirmation(reservationTemp: reservationPreview, userProfile: userProfilePreview)
        //ReservationConfirmation(reservationTemp: reservationPreview, userProfile: userProfilePreview)
        //ReservationConfirmation().environmentObject(Reservation())
    }
}
