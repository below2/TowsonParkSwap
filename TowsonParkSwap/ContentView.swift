//
//  ContentView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 10/22/22.
//

import SwiftUI
// Global delcarations:

// Global color object because used in login text fields
let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

// Sample username and pass (TODO: implement auth0 to authenticate registration and login)
let storedUsername = "Admin"
let storedPassword = "pass"

struct ContentView: View {
    
    // State property vars (state properties persistently update view):
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationFail: Bool = false
    // SET TO TRUE TO BYPASS LOGIN FOR DEBUGGING
    @State var authenticationPass: Bool = true
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // Stacks elements across Z-axis (unused right now)
            ZStack{
                // Stacks elements V-axis
                VStack {
                    
                    // Visual elements (extracted to subviews)
                    WelcomeText()
                    AppLogo()
                    UsernameTextField(username: $username)
                    PasswordSecureField(password: $password)
                    
                    // If login fail, display text
                    if authenticationFail {
                        Text("Login failed")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    
                    // If login pass, display NavigationLink
                    if authenticationPass {
                        NavigationLink("Login", destination: ParkerSwapperView())
                    }
                    
                    // Button (logic and action)
                    Button(action: {
                        if self.username == storedUsername && self.password == storedPassword {
                            self.authenticationPass = true
                            self.authenticationFail = false
                        } else {
                            self.authenticationPass = false
                            self.authenticationFail = true
                        }
                    }) {
                        // Button visual
                        LoginButtonContent()
                    }
                }
                // Padding for VStack itself, saw that you should do this online, but unsure why
                .padding()
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

// Login button text and design
struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.yellow)
            .cornerRadius(15.0)
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

// Username text field and design (bound to state var $username and design)
struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

// Password secure field and design (bound to state var $password and design)
struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
