import SwiftUI

struct RegistrationPage4: View {
    
    @State private var dob: Date = Date()
    
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
                Text("Enter your Birthday")
                    .font(.title2)
                    .padding(.trailing, 160.0)
                    .padding(.top, 20)
                    
                Text("Enter the day your were born")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 50)
                    .padding(.trailing, 120)
                    .padding(.top,-4)
                
                DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding([.leading, .bottom, .trailing], 56.0)
                
                
                Spacer()
                
                Button(action: {
                    // Handle registration logic here
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(0.0)
                        .frame(width: 285, height: 36)
                        .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                        .cornerRadius(15.0)
                }
                .padding(.bottom, 250.0)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RegistrationPage4_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPage4()
    }
}
