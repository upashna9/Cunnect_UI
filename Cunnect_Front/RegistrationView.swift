import Foundation
import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var cuny_email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var major: String = ""
    @State private var birthday: String = ""
   // @State private var graduationYear: String = ""
    @State private var CUNY: String = ""
    @State private var showAlert: Bool = false

    let cunyCampuses = ["Baruch College", "Brooklyn College", "City College", "College of Staten Island", "Graduate Center", "Hunter College", "John Jay College", "Lehman College", "Medgar Evers College", "NYC College of Technology", "Queens College", "York College", "Borough of Manhattan Community College", "Bronx Community College", "Guttman Community College", "Hostos Community College", "Kingsborough Community College", "LaGuardia Community College", "Queensborough Community College"]

    var body: some View {
        ScrollView {
            VStack {
                Text("Create an Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("CUNY Email", text: $cuny_email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Major", text: $major)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("birth_date", text: $birthday)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("CUNY", text: $CUNY)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
              //  TextField("graduation_year", text: $graduationYear)
              //      .textFieldStyle(RoundedBorderTextFieldStyle())
               //     .padding()
                
    
              /*  VStack(alignment: .leading, spacing: 5) {
                    Text(" Graduation Year     ")
                    Picker(selection: $graduationYear, label: Text("Graduation Year")) {
                        ForEach(2023..<2030) {
                            Text(String(format: "%d", $0))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }*/
             //   .padding()

             /*  VStack(alignment: .leading, spacing: 5) {
                    Text("   CUNY Campus")
                    Picker(selection: $CUNY, label: Text("Campus")) {
                        ForEach(cunyCampuses, id: \.self) { campus in
                            Text(campus)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }*/
                //.padding()
            }
            Button(action: {
                // Code to handle button action
                showAlert = true
                
                // Create a URLRequest with the backend URL
                let url = URL(string: "http://127.0.0.1:8000/Register/")!
                var request = URLRequest(url: url)
                
                // Set the HTTP method to POST
                request.httpMethod = "POST"
                /*
                let postString = "username=post2&first_name=post2&last_name=post23 &cuny_email=post2@myhunter.cuny.edu&password=12345&confirm_password=12345&major=English2&CUNY=Hunter College";
                
                request.httpBody = postString.data(using: String.Encoding.utf8);
                */
                let formData = [
                    "username": username,
                    "first_name": firstName,
                    "last_name": lastName,
                    "cuny_email": cuny_email,
                    "password": password,
                    "confirm_password": confirmPassword,
                    "major": major,
                    "CUNY": CUNY
                ]

                var posttString = ""
                for (key, value) in formData {
                    if !posttString.isEmpty {
                        posttString += "&"
                    }
                    posttString += "\(key)=\(value)"
                }
                
                request.httpBody = posttString.data(using: String.Encoding.utf8);

                // Create a JSON request body with the user data
                /*
                let userData: [String: Any] = [
                    "username": "turingmachinesarecool",
                    "first_name": "turing",
                    "last_name": "machines",
                    "cuny_email": "turingmachinesrcool@myhunter.cuny.edu",
                    "password": "abc",
                    "confirm_password": "abc",
                    "major": "hustlersuniversity",
                    "CUNY": "Hunter College",
                    "graduation_year": "2021"
                ]*/


                /*let jsonData = try! JSONSerialization.data(withJSONObject: postString, options: [])
                request.httpBody = jsonData
                print(String(data: jsonData, encoding: .utf8) ?? "")*/

                
                // Create a URLSession data task to send the request
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    // Handle the response
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else if let response = response as? HTTPURLResponse, let data = data {
                        print("Response status code: \(response.statusCode)")
                        print("Response body: \(String(data: data, encoding: .utf8) ?? "")")
                    }
                }
                task.resume()
            }, label: {
                Text("Sign Up")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })

         }
         .padding()
            .padding()
        }
    }


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
