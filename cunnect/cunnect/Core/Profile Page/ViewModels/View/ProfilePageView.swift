//
//  ProfilePageView.swift
//  cunnect
//
//  Created by Upashna Shahi on 4/3/23.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        
        VStack {
            HStack{
                Button(action: {
                    
                    // Action to add something
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                        .clipShape(Circle())
                }
                Image("image 1")
                    .padding(.leading, 60.0)
                Button(action: {
                    // Action to perform when button is tapped
                }) {
                    Image(systemName: "list.bullet.below.rectangle")
                        .font(.title)
                        .foregroundColor(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                }
                 
            }
            
            Image("image 3")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
                
            
            Text("John Doe")
                .font(.title2)
           
            
            Text("Computer Science")
                .font(.title3)
                .foregroundColor(.gray)
            
            Text("Hunter College")
                .font(.title3)
                .foregroundColor(.gray)

            
            
            
            
            Button(action: {
                // Action to edit profile
            }) {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150.0, height: 30.0)
                    .background(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                    .cornerRadius(10)
                
            }
            Spacer()
            
            VStack(alignment: .leading) {
                Text("College student passionate about computers")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom], 50)
                
                
                HStack {
                    VStack {
                        Text("120")
                            .font(.title2)
                            
                        
                        Text("Connections")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // Action to show my posts
                        }) {
                            Text("My Posts")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 150.0, height: 30.0)
                                .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                                .cornerRadius(10.0)
                            Spacer()
                        }
                    }
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("32")
                            .font(.title2)
                        
                        Text("Posts")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Button(action: {
                            // Action to show my classes
                        }) {
                            Text("My Classes")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 150.0, height: 30.0)
                                .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                            
                                .cornerRadius(10)
                            
                        Spacer()
                        }
                    
                    
                    }
                    
                    
                    
                }
                .padding([.leading, .bottom, .trailing], 70.0)
            }
            
            
            
            
            
        }
        .padding(.bottom, 200.0)
    }
}




struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
