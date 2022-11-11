//
//  ParkerView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/26/22.
//

import SwiftUI

struct ParkerView: View {
    
    // State property vars:
    // Handle general specifier for location selection
    @State var showGarage: Bool = true
    @State var showStreet: Bool = true
    @State var showParkingLot: Bool = true
    
    // Handle optional specifier for garage location selection
    @State var showGarageSelections: Bool = false
    @State var showGarageWV: Bool = true
    @State var showGarageTT: Bool = true
    @State var showGarageU: Bool = true
    @State var showGarageG: Bool = true
    
    // Handle specifier for location selection
    @State var showGarageFloorSelections: Bool = false
    @State var showStreetSelections: Bool = false
    @State var showParkingLotSelections: Bool =  false
    
    // NavigationLink is not shown until selection is made
    @State var canContinue: Bool = false
    
    // Initiate LocationSelection object
    @State var userLocationSelection = LocationSelection(
        general: "",
        optionalSpecifier: "",
        specifier: "")
    
    var body: some View {
        VStack {
            // Reserve text
            ReserveText()
            
            if showGarage {
                // Garage button
                Button(action: {
                    showGarageSelections.toggle()
                    showStreet.toggle()
                    showParkingLot.toggle()
                    
                    showStreetSelections = false
                    showParkingLotSelections = false
                    
                    canContinue = false
                    
                    userLocationSelection.general = "Garage parking"
                }) {
                    Garage()
                }
            }
            
            if showStreet {
                // Street button
                Button(action: {
                    showStreetSelections.toggle()
                    showGarage.toggle()
                    showParkingLot.toggle()
                    
                    showGarageSelections = false
                    showParkingLotSelections = false
                    
                    canContinue = false
                    
                    userLocationSelection.general = "Street parking"
                    userLocationSelection.optionalSpecifier = "near the"
                }) {
                    Street()
                }
            }
            
            if showParkingLot {
                // Parking lot button
                Button(action: {
                    showParkingLotSelections.toggle()
                    showGarage.toggle()
                    showStreet.toggle()
                    
                    showGarageSelections = false
                    showStreetSelections = false
                    
                    canContinue = false
                    
                    userLocationSelection.general = "Parking lot"
                    userLocationSelection.optionalSpecifier = ""
                }) {
                    ParkingLot()
                }
            }
            
//--------------------------------------------------------------------//
            // Garage, in <garages>, buttons, on floor <floors>, buttons
            if showGarageSelections {
                Text("in")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                VStack {
                    // Garage optional specifier selections:
                    if showGarageWV {
                        Button(action: {
                            showGarageTT.toggle()
                            showGarageU.toggle()
                            showGarageG.toggle()
                            showGarageFloorSelections.toggle()
                            
                            userLocationSelection.optionalSpecifier = "West Village Parking Garage"
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
                            
                            userLocationSelection.optionalSpecifier = "Towsontown Parking Garage"
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
                            
                            userLocationSelection.optionalSpecifier = "Union Parking Garage"
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
                            
                            userLocationSelection.optionalSpecifier = "Glen Parking Garage"
                        }) {
                            GarageG()
                        }
                    }
                }
                
                // Garage specifier selections:
                if showGarageFloorSelections {
                    Text("on floor")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    // Garage, first row (1-3)
                    HStack {
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor One"
                        }) {
                            FloorOne()
                        }
                        
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor Two"
                        }) {
                            FloorTwo()
                        }
                        
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor Three"
                        }) {
                            FloorThree()
                        }
                    }
                    
                    // Garage, second row (4-6)
                    HStack {
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor Four"
                        }) {
                            FloorFour()
                        }
                        
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor Five"
                        }) {
                            FloorFive()
                        }.disabled(showGarageU)
                        
                        Button(action: {
                            canContinue = true
                            userLocationSelection.specifier = "Floor Six"
                        }) {
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
                
                // Street specifier selections:
                // Street, first row (Center for the Arts and Union Parking Garage)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Center for the Arts"
                    }) {
                        CenterForTheArts()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Union Parking Garage"
                    }) {
                        UnionParkingGarage()
                    }
                }
                
                // Street, second row (Towers and Administration building)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Towers"
                    }) {
                        Towers()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Administration Building"
                    }) {
                        AdministrationBuilding()
                    }
                }
                
                // Street, third row (Towson Place Apartments and Glen Parking Garage)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Towson Place Apartments"
                    }) {
                        TowsonPlaceApartments()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Glen Parking Garage"
                    }) {
                        GlenParkingGarage()
                    }
                }
            }
            
            // Parking lot, lot number <number>, buttons
            if showParkingLotSelections {
                Text("lot number")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                // Parking lot specifier selections:
                // Parking lot, first row (1-4)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 1"
                    }) {
                        LotOne()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 2"
                    }) {
                        LotTwo()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 3"
                    }) {
                        LotThree()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 4"
                    }) {
                        LotFour()
                    }
                }
                
                // Parking lot, second row (5-8)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 5"
                    }) {
                        LotFive()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 6"
                    }) {
                        LotSix()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 7"
                    }) {
                        LotSeven()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 8"
                    }) {
                        LotEight()
                    }
                }
                
                // Parking lot, third row (8a-11)
                HStack {
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 8A"
                    }) {
                        LotEightA()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 9"
                    }) {
                        LotNine()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 10"
                    }) {
                        LotTen()
                    }
                    
                    Button(action: {
                        canContinue = true
                        userLocationSelection.specifier = "Lot 11"
                    }) {
                        LotEleven()
                    }
                }
                
                // Parking lot, last row (14)
                Button(action: {
                    canContinue = true
                    userLocationSelection.specifier = "Lot 14"
                }) {
                    LotFourteen()
                }
            }
            
//--------------------------------------------------------------------//
            
            // NavigationLink formatting:
            if canContinue {
                // Gray divider line
                Divider()
                    .frame(width: 360.0)
                    .background(Color.gray)
                    .offset(y: 20)
                
                NavigationLink("Continue", destination: ReservationTimeView(locationSelection: userLocationSelection))
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 380.0, height: 60.0)
                    .background(Color.yellow)
                    .cornerRadius(10.0)
                    .offset(y: 40)
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

// Extracted subviews (TODO: refactor)
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
