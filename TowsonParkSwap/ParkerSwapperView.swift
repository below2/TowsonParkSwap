//
//  SwiftUIView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI

struct ParkerSwapperView: View {
    
    // State property vars:
    @State var parkerSelected: Bool = false
    @State var swapperSelected: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // Parker button
            Button(action: {
                parkerSelected.toggle()
                swapperSelected = false
            }) {
                Text("PARKER")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 280.0, height: 180)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
            }
            
            Spacer()
            
            // Gray divider line
            Divider()
                .frame(width: 360.0)
                .background(Color.gray)
            
            Spacer()
            
            // Swapper button
            Button(action: {
                swapperSelected.toggle()
                parkerSelected = false
            }) {
                Text("SWAPPER")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 280.0, height: 180)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
            }
            
            Spacer()
            
            // NavigationLink logic for parker
            if parkerSelected {
                // Gray divider line
                Divider()
                    .frame(width: 360.0)
                    .background(Color.gray)
                    .offset(y: -10)
                
                Text("Parker role selected")
                    .font(.title3)
                
                NavigationLink("Continue", destination: ParkerView())
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 280.0, height: 60.0)
                    .background(Color.yellow)
                    .cornerRadius(10.0)
            }
            
            // NavigationLink logic for swapper
            else if swapperSelected {
                // Gray divider line
                Divider()
                    .frame(width: 360.0)
                    .background(Color.gray)
                    .offset(y: -10)
                
                Text("Swapper role selected")
                    .font(.title3)
                
                NavigationLink("Continue", destination: SwapperView())
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 280.0, height: 60.0)
                    .background(Color.yellow)
                    .cornerRadius(10.0)
            }
        }
        .padding()
    }
}

struct ParkerSwapperView_Previews: PreviewProvider {
    static var previews: some View {
        ParkerSwapperView()
    }
}
