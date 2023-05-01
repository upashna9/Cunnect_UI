//
//  RegistrationPage6View.swift
//  cunnect
//
//  Created by Upashna Shahi on 4/3/23.
//

import SwiftUI

struct RegistrationPage6View: View {
    @State private var Major: String = ""
    @State private var college = ""
    
    var body: some View {
        VStack {
            Image("image 1")
                .padding([.leading, .bottom], 80.0)
            Text("Enter your Major")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.trailing, 200.0)
                
            TextField("Major", text: $Major)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .padding(.horizontal)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            Text("Enter your CUNY College")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.trailing, 140.0)
            
            TextField("College", text: $college)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .padding(.horizontal)
           
            Button(action: {
                // Perform login action
            }) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                    .cornerRadius(10.0)
                    .padding(.horizontal)
            }
            
                
              
               
            
            .padding(.horizontal)
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

            struct RegistrationPage6View_Previews: PreviewProvider {
                static var previews: some View {
                    RegistrationPage6View()
                }
            }
      
