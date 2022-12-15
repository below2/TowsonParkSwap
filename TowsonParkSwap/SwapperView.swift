//
//  SwapperView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/27/22.
//


// This needs to be dealt with later

import SwiftUI
import RealmSwift

struct SwapperView: View {

    @EnvironmentObject var availableList: AvailableList
    
    @State var makeSelection: Bool = true
    
    var userProfile: Profile
    
    var body: some View {

        ZStack {
            VStack {
                
                Text("Reservation requests:")
                    .font(.largeTitle)
                    .padding()
                
                if availableList.availableList.isEmpty {
                    Text("No reservations available!")
                        .font(.title2)
                }
                
                ForEach(availableList.availableList, id: \.id) { reservation in
                    
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
}

struct SwapperView_Previews: PreviewProvider {
    static let userProfilePreview = Profile.empty
    
    static var previews: some View {
        SwapperView(userProfile: userProfilePreview).environmentObject(AvailableList())
    }
}
