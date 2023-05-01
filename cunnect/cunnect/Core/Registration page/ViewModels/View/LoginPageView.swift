import SwiftUI

struct LoginPageView: View {
    @State private var name: String = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image("image 1")
                .padding([.leading, .bottom], 80.0)
            Text("Enter your username")
                .foregroundColor(.gray)
                .padding(.trailing, 190.0)
                
            TextField("Username", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .padding(.horizontal)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .padding(.horizontal)
            Button(action: {
                // Perform forgot password action
            }) {
                Text("Forgot Password")
                    .foregroundColor(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                    .padding(.leading, 220.0)
            }
            
            Button(action: {
                // Perform login action
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                    .cornerRadius(10.0)
                    .padding(.horizontal)
            }
            HStack {
                
              
                Button(action: {
                    // Perform sign up action
                }) {
                    Text("Sign Up")
                        .foregroundColor(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                        .padding(.leading, 220.0)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
