//
//  ContentView.swift
//  cunnect
//
//  Created by Upashna Shahi on 3/29/23.
//

import SwiftUI



struct RegistrationPage: View {
   
    @State private var email: String = ""
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("Register")
                    .font(.title)
                Divider()
                    
                    .frame(height: 01.0)
                    .background(Color.black)
                Spacer()
                    .padding(-1.0)
                
                Text("EMAIL")
                    .font(.title2)
                    .padding(.trailing, 285.00)
                Text("Enter your CUNY email address")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 110.0)
                TextField("@cuny.edu", text: $email)
                    .padding(.vertical, 5.0)
                    .background(Color(.systemGray6))
                    .frame(width: 350, height: 50)
                    .cornerRadius(15.0)
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
                .padding(.bottom, 500.0)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    // Handle back button logic here
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.top, 10.0)
                        .font(.title2)
                }
            )
        }
        .padding(.bottom, 70.0)
        
    }

    
    struct RegistrationPage_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationPage()
        }
    }}
