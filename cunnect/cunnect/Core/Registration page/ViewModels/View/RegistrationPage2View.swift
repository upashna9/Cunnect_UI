//
//  RegistrationPage2.swift
//  cunnect
//
//  Created by Upashna Shahi on 3/29/23.
//

import SwiftUI

struct RegistrationPage2: View {
   
    @State private var confirmationCode: String = ""
    let email: String // new variable for email
    
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
                Text("Enter Confirmation Code")
                    .font(.title2)
                    .padding(.trailing, 120.00)
                HStack {
                    Text("Enter the code sent to \(email)")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .lineLimit(5)
                        .padding(.trailing, 35.0)
                   
                }
                Button(action: {
                    // Handle button action here
                }) {
                
                    Text("Resend Code")
                        .foregroundColor(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                        .padding(.leading, 250.0)
                }
                TextField("123456", text: $confirmationCode)
                    .padding(.vertical, 5.0)
                    .background(Color(.systemGray6))
                    .frame(width: 350, height: 50)
                    .cornerRadius(15.0)
                Button(action: {
                    // Handle confirmation code logic here
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
        .padding(.bottom, 50.0)
    }

    struct RegistrationPage2_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationPage2(email: "example@cuny.edu")
        }
    }
}
