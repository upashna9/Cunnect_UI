//
//  RegistrationPage3.swift
//  cunnect
//
//  Created by Upashna Shahi on 3/29/23.
//

import SwiftUI

struct RegistrationPage3: View {
   
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        // Handle back button logic here
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.top, 10.0)
                            .font(.title2)
                    }
                    Spacer()
                    Text("Register")
                        .font(.title)
                    Spacer()
                }
                Divider()
                    .frame(height: 01.0)
                    .background(Color.black)
                Spacer()
                    .padding(-1.0)
                
                Text("Enter name and create password")
                    .font(.title2)
                    .padding(.trailing, 40)
                Text("Enter your name so that your friends can find you.")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 15.0)
                    .padding(.bottom, 50)
            
                VStack(spacing: 0) {
                    TextField("Name", text: $name)
                        .padding(.vertical, 5.0)
                        .background(Color(.systemGray6))
                        .frame(width: 350, height: 60)
                        .cornerRadius(15.0)
                    SecureField("Password", text: $password)
                        .padding(.vertical, 5.0)
                        .background(Color(.systemGray6))
                        .frame(width: 350, height: 60)
                        .cornerRadius(15.0)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding(.vertical, 5.0)
                        .background(Color(.systemGray6))
                        .frame(width: 350.0, height: 59.0)
                        .cornerRadius(15.0)
                }
                .padding(.top,-9)
                Button(action: {
                    // Handle registration logic here
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 285, height: 36)
                        .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                        .cornerRadius(15.0)
                }
                .padding(.top, 30)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
        .padding(.bottom, 300.0)
    }

    struct RegistrationPage3_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationPage3()
        }
    }
}
