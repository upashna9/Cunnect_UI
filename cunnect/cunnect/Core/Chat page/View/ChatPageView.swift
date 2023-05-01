import SwiftUI

struct ChatPage: View {
    
    @State private var searchText = ""
    @State private var isMuted = false
    @State private var isPinned = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                List {
                    ForEach(0..<10) { index in
                        NavigationLink(destination: ChatDetailPage()) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing)
                                VStack(alignment: .leading) {
                                    Text("Chat \(index)")
                                    Text("Message Preview")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                if isMuted {
                                    Image(systemName: "bell.slash.fill")
                                        .foregroundColor(.red)
                                }
                                if isPinned {
                                    Image(systemName: "pin.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarTitle("Chats")
            .navigationBarItems(trailing:
                HStack(spacing: 20) {
                    Button(action: {
                        isMuted.toggle()
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(isMuted ? .red : .primary)
                    }
                    
                    Button(action: {
                        isPinned.toggle()
                    }) {
                        Image(systemName: "pin.fill")
                            .foregroundColor(isPinned ? .blue : .primary)
                    }
                    
                    EditButton()
                }
            )
        }
    }
}

struct ChatDetailPage: View {
    
    var body: some View {
        Text("Chat Detail Page")
            .navigationBarTitle("Chat Detail")
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $text)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct ContentView: View {
    var body: some View {
        ChatPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
