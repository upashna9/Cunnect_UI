import SwiftUI
import Combine
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
                return
            }
            parent.selectedImage = image
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}


struct PostAPI: Codable, Identifiable {
    let id: Int
    let user: Int
    let image: String?
    let caption: String
    let date_created: String
    let num_likes: Int
    let comments: [Comment]
    let users_who_liked: [String]

    struct Comment: Codable {
        let post: Int
        let user: Int
        let text: String
        let created_at: String
    }
}

struct Postt: Identifiable {
    let id: Int
    let image: UIImage?
    let caption: String
    let createdAt: Date
}



struct PostView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading) {
            if let image = post.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
            }
            Text(post.caption)
                .font(.headline)

            Text(post.createdAt, style: .date)
                .font(.caption)
        }
    }
}

struct FeedPage: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var caption = ""
    @State private var posts = [Post]()

    func fetchPosts() {
        guard let url = URL(string: "http://127.0.0.1:8000/Posts/") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([PostAPI].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedResponse.map { postAPI in
                            Post(
                                //id: postAPI.id,
                                image: postAPI.image != nil ? UIImage(data: Data(base64Encoded: postAPI.image!)!) : nil,
                                caption: postAPI.caption,
                                createdAt: ISO8601DateFormatter().date(from: postAPI.date_created) ?? Date()
                            )
                        }
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        task.resume()
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(red: 0.7529411764705882, green: 0.3764705882352941, blue: 0.16470588235294117))
                        .cornerRadius(8)
                        .onTapGesture {
                            self.showImagePicker = true
                        }
                    Text("Post Picture")
                        .font(.headline)
                }
                .padding(.bottom)

                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: self.$selectedImage)
                }

                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()

                    TextField("Write a caption...", text: $caption)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom)

                 /*  Button(action: {
                        let post = Post(id: Int.random(in: 0...10000), image: image, caption: caption, createdAt: Date())
                        posts
                        posts.append(post)
                        selectedImage = nil
                        caption = ""
                //
                    
               // })
                    {
                        Text("Post")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }*/
                } else {
                    TextField("Write a status...", text: $caption)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom)

                  /*  Button(action: {
                        let post = Post(id: Int.random(in: 0...10000), image: nil, caption: caption, createdAt: Date())
                        posts.append(post)
                        caption = ""
                    }) {
                        Text("Post")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.09803921568627451, green: 0.19215686274509805, blue: 0.5333333333333333))
                            .cornerRadius(10.0)
                            .padding(.horizontal)
                    }*/
                }

                List(posts) { post in
                    PostView(post: post)
                }
            }
            .navigationTitle("Feed")
            .onAppear(perform: fetchPosts)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPage()
    }
}

