//
//  ActivityView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/14/22.
//

import SwiftUI
import RealmSwift

struct ActivityView: View {

    @EnvironmentObject var reservationList: ReservationList
    @EnvironmentObject var fulfillmentList: FulfillmentList
    
    @State var makeSelection: Bool = false
    
    var userProfile: Profile
    
    var body: some View {

        VStack {
            Text("Reservations requested:")
                .font(.largeTitle)
                .padding()
            
            if reservationList.reservationList.isEmpty {
                Text("No reservations made!")
                    .font(.title2)
            }
            
            ForEach(reservationList.reservationList, id: \.id) { reservation in
                
                NavigationLink(destination: ResvDetailView(reservation: reservation, userProfile: userProfile, makeSelection: makeSelection), label: {
                    HStack {
                        Text(reservation.general)
                        Spacer()
                        Text("$<price>")
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 365.0, height: 60)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
                })
            }
            
            Text("Reservations to fulfill:")
                .font(.largeTitle)
                .padding()
            
            if fulfillmentList.fulfillmentList.isEmpty {
                Text("No reservations to fulfill!")
                    .font(.title2)
            }
            
            ForEach(fulfillmentList.fulfillmentList, id: \.id) { reservation in
                
                NavigationLink(destination: ResvDetailView(reservation: reservation, userProfile: userProfile, makeSelection: makeSelection), label: {
                    HStack {
                        Text(reservation.general)
                        Spacer()
                        Text("$<price>")
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 365.0, height: 60)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
                })
            }
            
            Spacer()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let userProfilePreview = Profile.empty
    
    static var previews: some View {
        //ReservationConfirmation(reservation: reservationPreview)
        ActivityView(userProfile: userProfilePreview).environmentObject(ReservationList())
        ActivityView(userProfile: userProfilePreview).environmentObject(FulfillmentList())
    }
}
