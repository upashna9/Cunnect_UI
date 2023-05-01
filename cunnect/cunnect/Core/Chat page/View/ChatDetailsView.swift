import SwiftUI
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let sender: User
    let isSentByMe: Bool
}

struct User {
    let name: String
    let profileImageName: String
}

extension User {
    static let me = User(name: "Me", profileImageName: "profile")
    static let jane = User(name: "Jane", profileImageName: "jane")
    static let john = User(name: "John", profileImageName: "john")
}

extension Message {
    static let example = [
        Message(text: "Hello!", sender: .jane, isSentByMe: false),
        Message(text: "Hi Jane!", sender: .me, isSentByMe: true),
        Message(text: "How are you doing?", sender: .me, isSentByMe: true),
        Message(text: "I'm doing well, thanks for asking.", sender: .jane, isSentByMe: false),
        Message(text: "That's great to hear!", sender: .me, isSentByMe: true)
    ]
}

struct ChatView: View {
    var chat: Chat
    @State var text = ""
    @State var showDetails = false
    
    var body: some View {
        VStack {
            // Chat Header
            HStack {
                Image(chat.profileImageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(chat.name)
                    .font(.title3)
                    .bold()
                Spacer()
                Button(action: { showDetails.toggle() }) {
                    Image(systemName: "info.circle")
                }
                .sheet(isPresented: $showDetails) {
                    // Details View
                    ChatDetailsView(chat: chat)
                }
            }
            .padding()
            Divider()
            // Chat Messages
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chat.messages) { message in
                        if message.isSentByMe {
                            SentMessageView(message: message)
                        } else {
                            ReceivedMessageView(message: message)
                        }
                    }
                }
                .padding(.horizontal)
            }
            Divider()
            // Chat Input
            HStack {
                Image(systemName: "paperclip")
                    .font(.title2)
                    .foregroundColor(.gray)
                TextField("Type a message", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
            .padding()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
    func sendMessage() {
        // Send message logic
    }
}

struct ChatDetailsView: View {
    var chat: Chat
    
    var body: some View {
        VStack {
            HStack {
                Image(chat.profileImageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(chat.name)
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle")
                }
            }
            .padding()
            Divider()
            Text("Shared Media")
                .font(.headline)
                .padding()
            Spacer()
        }
    }
    
    func dismiss() {
        // Dismiss details view
    }
}

struct SentMessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            Spacer()
            Text(message.text)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(MessageBubble(isFromMe: true))
        }
    }
}

struct ReceivedMessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            Image(message.sender.profileImageName)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .padding(.trailing, 10)
            Text(message.text)
                .padding(10)
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.2))
                .clipShape(MessageBubble(isFromMe: false))
            Spacer()
        }
    }
}

struct MessageBubble: Shape {
    var isFromMe: Bool
    
    func path(in rect: CGRect) -> Path {
        let r = rect.height / 2
        let path = Path { p in
            if isFromMe {
                p.move(to: CGPoint(x: rect.maxX - r, y: rect.minY))
                p.addLine(to: CGPoint(x: rect.minX + r, y: rect.minY))
                p.addArc(center: CGPoint(x: rect.minX + r, y: rect.minY + r), radius: r, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: true)
                p.addLine(to: CGPoint(x: rect.maxX - r, y: rect.minY + rect.height * 0.35))
                p.addLine(to: CGPoint(x: rect.maxX - r, y: rect.minY))
            } else {
                p.move(to: CGPoint(x: rect.minX + r, y: rect.minY))
                p.addLine(to: CGPoint(x: rect.maxX - r, y: rect.minY))
                p.addArc(center: CGPoint(x: rect.maxX - r, y: rect.minY + r), radius: r, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: false)
                p.addLine(to: CGPoint(x: rect.minX + r, y: rect.minY + rect.height * 0.35))
                p.addLine(to: CGPoint(x: rect.minX + r, y: rect.minY))
            }
        }
        return path
    }
}
struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let profileImageName: String
    let messages: [Message]

    static let example = Chat(name: "John Smith", profileImageName: "person.circle", messages: [
     
    ])
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.example)
    }
}
