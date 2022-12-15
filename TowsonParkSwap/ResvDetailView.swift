//
//  ResvDetailView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/15/22.
//

import SwiftUI

struct ResvDetailView: View {
    
    @EnvironmentObject var availableList: AvailableList
    @EnvironmentObject var fulfillmentList: FulfillmentList
    
    @State var selectionMade: Bool = false
    @State var showConfirmation: Bool = false
    
    var reservation: Reservation
    var userProfile: Profile
    var makeSelection: Bool
    
    var body: some View {
        var reservationToFulfill = Reservation()
        ZStack {
            VStack {
                Text("Reservation details:")
                    .font(.largeTitle)
                Spacer()
                Group {
                    HStack {
                        Text("General:")
                            .font(.title3)
                            .offset(x: 10)
                        Spacer()
                        Text(reservation.general)
                            .font(.title3)
                            .offset(x: -10)
                    }
                    if reservation.optionalSpecifier != "near the" && reservation.optionalSpecifier != "" {
                        HStack {
                            Text("Location:")
                                .font(.title3)
                                .offset(x: 10)
                            Spacer()
                            Text(reservation.optionalSpecifier)
                                .font(.title3)
                                .offset(x: -10)
                        }
                    }
                    else if reservation.optionalSpecifier == "near the" {
                        HStack {
                            Spacer()
                            Text(reservation.optionalSpecifier)
                                .font(.title3)
                                .offset(x: -10)
                        }
                    }
                    HStack {
                        Text("Specifier:")
                            .font(.title3)
                            .offset(x: 10)
                        Spacer()
                        Text(reservation.specifier)
                            .font(.title3)
                            .offset(x: -10)
                    }
                }
                // Gray divider line
                Divider()
                    .frame(width: 360.0)
                    .background(Color.gray)
                HStack {
                    Text("Time:")
                        .font(.title3)
                        .offset(x: 10)
                    Spacer()
                    Text("\(reservation.time.getFormattedDate(format: "MMMM d h:mm a"))")
                        .font(.title3)
                        .offset(x: -10)
                }
                // Gray divider line
                Divider()
                    .frame(width: 360.0)
                    .background(Color.gray)
                Text("")
                Text("$<price>")
                    .font(.title3)
                Spacer()
                
                if makeSelection {
                    if !selectionMade {
                        Button(action: {
                            reservationToFulfill = reservation
                            fulfillmentList.add(reservation: reservationToFulfill)
                            availableList.remove(reservation: reservation)
                            selectionMade.toggle()
                            showConfirmation.toggle()
                        }) {
                            Text("Accept")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 365.0, height: 80)
                                .background(Color.yellow)
                                .cornerRadius(15.0)
                        }
                    }
                    else if selectionMade {
                        NavigationLink("Continue →", destination: ProfileView(userProfile: userProfile))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 365.0, height: 80.0)
                            .background(Color.yellow)
                            .cornerRadius(15.0)
                    }
                }
            }
            
            if showConfirmation {
                Text("Reservation accepted!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 1.0), value: showConfirmation)
                    .onTapGesture {
                        showConfirmation.toggle()
                    }
                    
            }
            
        }
        
    }
}

struct ResvDetailView_Previews: PreviewProvider {
    static let reservationPreview = Reservation()
    static let userProfilePreview = Profile.empty
    static let makeSelectionPreview = true
    
    static var previews: some View {
        ResvDetailView(reservation: reservationPreview, userProfile: userProfilePreview, makeSelection: makeSelectionPreview)
        
    }
}
