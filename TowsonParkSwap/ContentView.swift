//
//  ContentView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/22/22.
//

import SwiftUI
import Auth0

struct ContentView: View {
    
    // State property vars (state properties persistently update view):
    @State var authenticationPass: Bool = false
    @State var userProfile = Profile.empty
    
    var body: some View {
        // Necessary to navigate to next view
        NavigationView {
            
            // Stacks elements V-axis
            VStack {
                
                // Visual elements (extracted to subviews)
                WelcomeText()
                AppLogo()
                
                if authenticationPass == false {
                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 280.0, height: 80)
                            .background(Color.yellow)
                            .cornerRadius(15.0)
                    }
                } else {
                    NavigationLink("Continue", destination: ProfileView(userProfile: userProfile))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 280.0, height: 80)
                        .background(Color.yellow)
                        .cornerRadius(15.0)
                    
                    Button(action: {
                        logout()
                    }) {
                        Text("Log out")
                    }
                }
            }
        }
    }
}
    
    // EXTRACTED FUNCTIONS
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    // Welcome text and design
    struct WelcomeText: View {
        var body: some View {
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
        }
    }
    
    // Towson logo calling from assets folder (TODO: crop, change to custom logo)
    struct AppLogo: View {
        var body: some View {
            Image("towson_university_logo")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .aspectRatio(contentMode: .fit)
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        }
    }
    
    extension ContentView {
        func login() {
            Auth0
                .webAuth()
                .start { result in
                    switch result {
                    case .failure(let error):
                        print("Failed with: \(error)")
                    case .success(let credentials):
                        self.authenticationPass = true
                        self.userProfile = Profile.from(credentials.idToken)
                    }
                }
        }
        
        func logout() {
            Auth0
                .webAuth()
                .clearSession { result in
                    switch result {
                    case .failure(let error):
                        print("Failed with: \(error)")
                    case .success:
                        self.authenticationPass = false
                        self.userProfile = Profile.empty
                    }
                }
        }
    }
