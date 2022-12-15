//
//  HelpView.swift
//  TowsonParkSwap
//
//  Created by user229386 on 12/14/22.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct HelpView: View {
    
    @State var input: String = ""
    @State var outputInput: String = ""
    @State var outputText: String = ""
    @State var showPrompts: Bool = true
    
    var body: some View {
        
        VStack {
                Text("Need help? Just ask!")
                    .font(.largeTitle)
                    .offset(y: 20)
            
            if showPrompts {
                Text(outputInput)
                    .multilineTextAlignment(.center)
                    .frame(width: 365, height: 100.0)
                    .background(lightGreyColor)
                    .offset(y: 80)
                ScrollView {
                    Text(outputText)
                        .multilineTextAlignment(.center)
                        .frame(width: 365, height: 350.0)
                        .background(lightGreyColor)
                        .offset(y: 80)
                        .fixedSize()
                }
            }
            
            Spacer()
            
            HStack {
                
                TextField(
                    "Enter text here",
                    text: $input
                )
                .padding()
                .frame(width: 260.0)
                .background(lightGreyColor)
                .cornerRadius(5.0)
                //.padding(.bottom, 20)
                .offset(x: 15)
                Spacer()
                Button(action: {
                    showPrompts = true
                    APICaller.shared.setup()
                    APICaller.shared.getResponse(input: input) { result in
                        switch result {
                        case .success(let output):
                            outputText = output
                            outputInput = input
                            input = ""
                        case .failure:
                            outputText = "Something went wrong with the OpenAI API again, honestly if you see this message again just scrap this"
                        }
                    }
                }) {
                    Text("Send")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80.0, height: 60)
                        .background(Color.yellow)
                        .cornerRadius(15.0)
                        .offset(x: -15)
                }
                
            }
        }
        
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
