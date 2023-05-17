
//  ContentView.swift
//  whatever
//
//  Created by Upashna Shahi on 5/9/23.
//


import SwiftUI


struct UserProfileView: View {
    
    struct UserProfile {
        let user: Int
        let bio: String
        let cuny: String
        let major: String
        let birthDate: String
        let profilePic: String
        let dateUserJoined: String
        
        static func fetch(completion: @escaping (Result<UserProfile, Error>) -> Void) {
            let url = URL(string: "http://127.0.0.1:8000/UserProfile/")!
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Fetched data: \(json)")
                    if let array = json as? [[String: Any]], let dict = array.first {
                        let userProfile = UserProfile(
                            user: Int(dict["user"] as? String ?? "") ?? 18,
                            bio: dict["bio"] as? String ?? "",
                            cuny: dict["CUNY"] as? String ?? "",
                            major: dict["major"] as? String ?? "",
                            birthDate: dict["birth_date"] as? String ?? "",
                            profilePic: dict["profile_pic"] as? String ?? "",
                            dateUserJoined: dict["date_user_joined"] as? String ?? ""
                        )
                        completion(.success(userProfile))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    @State var userProfile: UserProfile?
    
    var body: some View {
        VStack {
            Image("image 1")
                .padding(.top, 50)
            if let userProfile = userProfile {
                VStack {
                    Text(String("john")) //userProfile.user
                        .font(.title)
                        .bold()
                        .padding(.top, 50)
                    
                    Image("Ellipse 2")
                    
                    Image(userProfile.profilePic)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .padding(.bottom, 20)
                    
                    Text(userProfile.bio)
                        .font(.title)
                        .bold()
                    
                    Text(userProfile.cuny)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.gray)
                    
                    Text(userProfile.major)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Birthdate")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text(userProfile.birthDate)
                                .font(.subheadline)
                        }
                        .padding(.trailing, 40)
                        
                        VStack(alignment: .leading) {
                            Text("Join Date")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text(userProfile.dateUserJoined)
                                .font(.subheadline)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        // Action to edit profile
                    }) {
                        Text("Edit Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 285, height: 36)
                            .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            UserProfile.fetch { result in
                switch result {
                case .success(let userProfile):
                    self.userProfile = userProfile
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
