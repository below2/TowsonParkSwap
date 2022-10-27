//
//  SwiftUIView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI

struct ParkerSwapperView: View {
    var body: some View {
        VStack {
            Spacer()
            
            // Parker button
            Button(action: {print("swith view to parking ui")}) {
                Text("PARKER")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 280.0, height: 180)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
            }
            
            // Parker text
            Text("Make a reservation")
                .font(.title2)
            
            Spacer()
            
            // Gray divider line
            Divider()
                .frame(width: 360.0)
                .background(Color.gray)
            
            Spacer()
            
            // Swapper button
            Button(action: {print("switch view to swapper ui")}) {
                Text("SWAPPER")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 280.0, height: 180)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
            }
            
            // Swapper text
            Text("Fulfill other user's reservation requests")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
    }
}

struct ParkerSwapperView_Previews: PreviewProvider {
    static var previews: some View {
        ParkerSwapperView()
    }
}
