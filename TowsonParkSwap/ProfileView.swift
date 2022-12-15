//
//  ProfileView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 11/15/22.
//

import SwiftUI
import RealmSwift

struct ProfileView: View {
    
    // Passed property var from ContentView
    var userProfile: Profile
    
    // State property vars:
    @State var parkerSelected: Bool = false
    @State var swapperSelected: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink("?", destination: HelpView())
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25.0)
                    .offset(x: 160)
            Spacer()
            
            // User image
            UserImage(urlString: userProfile.picture)
            
            // User details (TODO: add car details linked to user account)
            VStack {
                Text("Name: \(userProfile.name)")
                    .font(.title)
                Text("Email: \(userProfile.email)")
                    .font(.title)
            }
            
            Spacer()
            
            // Role selection options
            Group {
                
                Text("Select role:")
                    .font(.title3)
                
                HStack {
                    
                    // Parker button
                    Button(action: {
                        parkerSelected.toggle()
                        swapperSelected = false
                    }) {
                        Text("PARKER")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180.0, height: 100)
                            .background(Color.yellow)
                            .cornerRadius(15.0)
                    }
                    
                    // Swapper button
                    Button(action: {
                        swapperSelected.toggle()
                        parkerSelected = false
                    }) {
                        Text("SWAPPER")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180.0, height: 100)
                            .background(Color.yellow)
                            .cornerRadius(15.0)
                    }
                }
                
                Spacer()
                
                // NavigationLink logic for parker
                if parkerSelected {
                    // Gray divider line
                    Divider()
                        .frame(width: 360.0)
                        .background(Color.gray)
                        .offset(y: -30)
                    
                    Text("Parker role selected")
                        .font(.title3)
                    
                    NavigationLink("Continue →", destination: ParkerView(userProfile: userProfile))
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
                        .offset(y: -30)
                    
                    Text("Swapper role selected")
                        .font(.title3)
                    
                    NavigationLink("Continue →", destination: SwapperView(userProfile: userProfile))
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 280.0, height: 60.0)
                        .background(Color.yellow)
                        .cornerRadius(10.0)
                }
                
                else if !parkerSelected && !swapperSelected {
                    Divider()
                        .frame(width: 360.0)
                        .background(Color.gray)
                        .offset(y: -30)
                    
                    Text("View current activity")
                        .font(.title3)
                    
                    NavigationLink("Activity →", destination: ActivityView(userProfile: userProfile))
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 280.0, height: 60.0)
                        .background(Color.yellow)
                        .cornerRadius(10.0)
                }
            }
        }
        .padding()
    }
}

struct UserImage: View {
    // Given the URL of the user’s picture, this view asynchronously
    // loads that picture and displays it. It displays a “person”
    // placeholder image while downloading the picture or if
    // the picture has failed to download.
    
    var urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .frame(maxWidth: 128)
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.blue)
                .opacity(0.5)
        }
        .padding(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let userProfilePreview = Profile.empty
    
    static var previews: some View {
        ProfileView(userProfile: userProfilePreview)
    }
}



