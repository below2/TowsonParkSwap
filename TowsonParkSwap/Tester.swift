//
//  Tester.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/14/22.
//

import SwiftUI

struct Tester: View {
    @State var selectionMade: Bool = false
    var body: some View {
        ZStack {
            VStack {
                
                Text("Reservation requests:")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    selectionMade.toggle()
                }) {
                    HStack {
                        Text("Parking Garage")
                        Spacer()
                        Text("$<price>")
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 365.0, height: 60)
                    .background(Color.yellow)
                    .cornerRadius(15.0)
                }
            }
            
            if selectionMade {
                Rectangle()
                    .fill(.black)
                    .frame(width: 350, height: 300)
                    .cornerRadius(15.0)
                Rectangle()
                    .fill(.white)
                    .frame(width: 340, height: 290)
                    .cornerRadius(15.0)
                    .opacity(1.0)
                VStack {
                    Text("General: Parking garage")
                    Text("Location: West Village Parking Garage")
                    Text("Specifier: Floor one")
                    Text("")
                    Text("$<price>")
                    HStack {
                        Button(action: {
                            selectionMade.toggle()
                        })
                        {
                            Text("Close")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 120.0, height: 60)
                                .background(Color.yellow)
                                .cornerRadius(15.0)
                                .offset(x: -30, y: 40)
                        }
                        Button(action: {
                            // delete...
                        })
                        {
                            Text("Accept")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 120, height: 60)
                                .background(Color.yellow)
                                .cornerRadius(15.0)
                                .offset(x: 30, y: 40)
                        }
                    }
                }
            }
            
        }
    }
}

struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
