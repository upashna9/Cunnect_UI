import SwiftUI

struct RegistrationPage5: View {
    
    @State private var profileImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("image 1")
                        .padding(.leading, 60.0)
                        
                }
                
                VStack {
                    
                    
                    if let image = profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(70)
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                            .padding(.bottom, 10.0)
                        Text("UPLOAD PROFILE PICTURE")
                            .font(.headline)
                            .padding(.bottom, 0.0)
                    }
                    
                    Button(action: {
                        // Present an image picker to allow the user to choose a profile picture
                    }) {
                        Text("Choose Photo")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.trailing, -10.0)
                            .frame(width: 100, height: 36)
                    }
                }
                .padding(.bottom, 50.0)
                
                VStack {
                    Button(action: {
                        // Handle "Skip" logic here
                    }) {
                        Text("Skip")
                            .font(.headline)
                            
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 285, height: 36)
                            .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 0.0)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle "Next" logic here
                    }) {
                        Text("Next")
                        .font(.headline)
                        
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 285, height: 36)
                        .background(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                        .cornerRadius(15.0)
                        
                    }
                }
                .padding(.bottom, 90.0)
                
                Spacer()
            }
        }
        .padding(.bottom, 200.0)
    }
    
    struct RegistrationPage5_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationPage5()
        }
    }
}
