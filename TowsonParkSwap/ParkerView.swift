//
//  ParkerView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI

struct ParkerView: View {
    @State var showGarageSelections: Bool = false
    @State var showGarageWV: Bool = true
    @State var showGarageTT: Bool = true
    @State var showGarageU: Bool = true
    @State var showGarageG: Bool = true
    @State var showGarageFloorSelections: Bool = false
    
    @State var showStreetSelections: Bool = false
    @State var showParkingLotSelections: Bool =  false
    
    var body: some View {
        VStack {
            // Reserve text
            ReserveText()
            
            // Garage button
            Button(action: {
                showGarageSelections.toggle()
                showStreetSelections = false
                showParkingLotSelections = false
            }) {
                Garage()
            }
            
            // Street button
            Button(action: {
                showStreetSelections.toggle()
                showGarageSelections = false
                showParkingLotSelections = false
            }) {
                Street()
            }
            
            // Parking lot button
            Button(action: {
                showParkingLotSelections.toggle()
                showGarageSelections = false
                showStreetSelections = false
            }) {
                ParkingLot()
            }
            
//--------------------------------------------------------------------//
            // Garage, in <garages>, buttons, on floor <floors>, buttons
            if showGarageSelections {
                Text("in")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                VStack {
                    if showGarageWV {
                        Button(action: {
                            showGarageTT.toggle()
                            showGarageU.toggle()
                            showGarageG.toggle()
                            showGarageFloorSelections.toggle()
                        }) {
                            GarageWV()
                        }
                    }
                    
                    if showGarageTT {
                        Button(action: {
                            showGarageWV.toggle()
                            showGarageU.toggle()
                            showGarageG.toggle()
                            showGarageFloorSelections.toggle()
                            }) {
                            GarageTT()
                        }
                    }
                    
                    if showGarageU {
                        Button(action: {
                            showGarageWV.toggle()
                            showGarageTT.toggle()
                            showGarageG.toggle()
                            showGarageFloorSelections.toggle()
                        }) {
                            GarageU()
                        }
                    }
                    
                    if showGarageG {
                        Button(action: {
                            showGarageWV.toggle()
                            showGarageTT.toggle()
                            showGarageU.toggle()
                            showGarageFloorSelections.toggle()
                        }) {
                            GarageG()
                        }
                    }
                }

                
                if showGarageFloorSelections {
                    Text("on floor")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    // Garage, first row (1-3)
                    HStack {
                        Button(action: {print("1")}) {
                            FloorOne()
                        }
                        
                        Button(action: {print("2")}) {
                            FloorTwo()
                        }
                        
                        Button(action: {print("3")}) {
                            FloorThree()
                        }
                    }
                    
                    // Garage, second row (4-6)
                    HStack {
                        Button(action: {print("4")}) {
                            FloorFour()
                        }
                        
                        Button(action: {print("5")}) {
                            FloorFive()
                        }.disabled(showGarageU)
                        
                        Button(action: {print("6")}) {
                            FloorSix()
                        }.disabled(showGarageTT || showGarageU)
                    }
                }
            }
            
            // Street, near <locations> , buttons
            if showStreetSelections {
                Text("near the")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                // Street, first row (Center for the Arts and Union Parking Garage)
                HStack {
                    Button(action: {print("Center for the Arts")}) {
                        CenterForTheArts()
                    }
                    
                    Button(action: {print("Union Parking Garage")}) {
                        UnionParkingGarage()
                    }
                }
                
                // Street, second row (Towers and Administration building)
                HStack {
                    Button(action: {print("Towers")}) {
                        Towers()
                    }
                    
                    Button(action: {print("Administration Building")}) {
                        AdministrationBuilding()
                    }
                }
                
                // Street, third row (Towson Place Apartments and Glen Parking Garage)
                HStack {
                    Button(action: {print("Towson Place Apartments")}) {
                        TowsonPlaceApartments()
                    }
                    
                    Button(action: {print("Glen Parking Garage")}) {
                        GlenParkingGarage()
                    }
                }
            }
            
            // Parking lot, lot number <number>, buttons
            if showParkingLotSelections {
            Text("lot number")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
                // Parking lot, first row (1-4)
                HStack {
                    Button(action: {print("1")}) {
                        LotOne()
                    }

                    Button(action: {print("2")}) {
                        LotTwo()
                    }
                    
                    Button(action: {print("3")}) {
                        LotThree()
                    }
                    
                    Button(action: {print("4")}) {
                        LotFour()
                    }
                }
                
                // Parking lot, second row (5-8)
                HStack {
                    Button(action: {print("5")}) {
                        LotFive()
                    }
                    
                    Button(action: {print("6")}) {
                        LotSix()
                    }
                    
                    Button(action: {print("7")}) {
                        LotSeven()
                    }
                    
                    Button(action: {print("8")}) {
                        LotEight()
                    }
                }
                
                // Parking lot, third row (8a-11)
                HStack {
                    Button(action: {print("8a")}) {
                        LotEightA()
                    }
                    
                    Button(action: {print("9")}) {
                        LotNine()
                    }
                    
                    Button(action: {print("10")}) {
                        LotTen()
                    }
                    
                    Button(action: {print("11")}) {
                        LotEleven()
                    }
                }
                
                // Parking lot, last row (14)
                Button(action: {print("14")}) {
                    LotFourteen()
                }
            }
            
        }
        .padding()
    }
}

//--------------------------------------------------------------------//
struct ParkerView_Previews: PreviewProvider {
    static var previews: some View {
        ParkerView()
    }
}

struct ReserveText: View {
    var body: some View {
        Text("Reserve parking spot at a")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
    }
}

struct Garage: View {
    var body: some View {
        Text("GARAGE")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct Street: View {
    var body: some View {
        Text("STREET")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct ParkingLot: View {
    var body: some View {
        Text("PARKING LOT")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotOne: View {
    var body: some View {
        Text("1")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotTwo: View {
    var body: some View {
        Text("2")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotThree: View {
    var body: some View {
        Text("3")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotFour: View {
    var body: some View {
        Text("4")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotFive: View {
    var body: some View {
        Text("5")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotSix: View {
    var body: some View {
        Text("6")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotSeven: View {
    var body: some View {
        Text("7")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotEight: View {
    var body: some View {
        Text("8")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotEightA: View {
    var body: some View {
        Text("8a")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotNine: View {
    var body: some View {
        Text("9")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotTen: View {
    var body: some View {
        Text("10")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotEleven: View {
    var body: some View {
        Text("11")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 90, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct LotFourteen: View {
    var body: some View {
        Text("14")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385, height: 75)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct CenterForTheArts: View {
    var body: some View {
        Text("Center for the Arts")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct UnionParkingGarage: View {
    var body: some View {
        Text("Union Parking Garage")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct Towers: View {
    var body: some View {
        Text("Towers")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct AdministrationBuilding: View {
    var body: some View {
        Text("Administration Building")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct TowsonPlaceApartments: View {
    var body: some View {
        Text("Towson Place Apartments")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct GlenParkingGarage: View {
    var body: some View {
        Text("Glen Parking Garage")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 185, height: 100)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorOne: View {
    var body: some View {
        Text("1")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorTwo: View {
    var body: some View {
        Text("2")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorThree: View {
    var body: some View {
        Text("3")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorFour: View {
    var body: some View {
        Text("4")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorFive: View {
    var body: some View {
        Text("5")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct FloorSix: View {
    var body: some View {
        Text("6")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 95)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct GarageWV: View {
    var body: some View {
        Text("West Village Parking Garage")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct GarageTT: View {
    var body: some View {
        Text("Towsontown Parking Garage")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct GarageU: View {
    var body: some View {
        Text("Union Parking Garage")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}

struct GarageG: View {
    var body: some View {
        Text("Glen Parking Garage")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 385.0, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}