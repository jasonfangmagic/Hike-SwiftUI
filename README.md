# 1. @State You can make the struct mutable 

A property wrapper type that can read and write a value managed by SwiftUI. <br>
https://developer.apple.com/documentation/swiftui/state

    struct ContentView: View {
        
       @State private var count: Int = 0
        
        var body: some View {
            VStack {
                Text("\(count)")
                    .font(.largeTitle)
                Button("Increment"){
                    count += 1
                }
            }
        }
    }

# 2. Use $ to bind the var with toggle. Use toggle to change the state of the var, change from false to true

A property wrapper type that can read and write a value owned by a source of truth. <br>
https://developer.apple.com/documentation/swiftui/binding

        struct ContentView: View {
            
           @State private var isOn: Bool = false
            
            var body: some View {
                VStack {
                    Toggle(isOn: $isOn, label: {
                        Text(isOn ? "ON": "OFF")
                            .foregroundColor(.white)
                    }).fixedSize()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(isOn ? .black: .yellow)
            }
        }

# 3. Add a list using @State

        struct ContentView: View {
            
            @State private var name: String = ""
            @State private var friends: [String] = []
            var body: some View {
                VStack {
                    TextField("Enter Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            friends.append(name)
                            name = ""
                        }
                    
                    List(friends, id: \.self) {
                        friend in
                        Text(friend)
                    }
                    
                    Spacer()
                }.padding()
            }
        }

<img width="348" alt="image" src="https://github.com/jasonfangmagic/Hike-SwiftUI/assets/87825019/e5d8b15c-6997-427c-8b9b-2b71f3920ad7">

# 4. Not only need to add the NavigationStack in the preview, also need to add it in the App file
<img width="273" alt="image" src="https://github.com/jasonfangmagic/Hike-SwiftUI/assets/87825019/972fc07e-dd36-4afd-9328-58f75b355074">
<img width="698" alt="image" src="https://github.com/jasonfangmagic/Hike-SwiftUI/assets/87825019/0ddc1bf8-1483-4ffd-8d0b-4b819a70fe62">

# 5. To add a search bar, you must add a navigation bar

        struct ContentView: View {
            
            
            @State var search: String = ""
            @State private var friends: [String] = ["John", "Mary", "Steven", "Steve", "Jerry"]
            @State var filteredFriends: [String] = []
            var body: some View {
                VStack {
                    
                    List(filteredFriends, id: \.self) {
                        friend in
                        Text(friend)
                    }
                    .listStyle(.plain)
                    .searchable(text: $search)
                    .onChange(of: search) {
                        if search.isEmpty {
                            filteredFriends = friends
                        } else {
                            filteredFriends = friends.filter { $0.contains(search) }
                        }
                        
                        
                    }
                    
                    Spacer()
                }.padding()
                    .onAppear(perform: {
                        filteredFriends = friends
                    })
                    .navigationTitle("Friends")
            }
        }

# 5 Use @Binding to change the value of another struct 

        struct LightBulbView: View {
            
            @Binding var isOn: Bool
            
            var body: some View {
                
                VStack {
                    Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                        .font(.largeTitle)
                        .foregroundStyle(isOn ? .yellow : .black)
                    Button("Toggle"){
                        isOn.toggle()
                        
                    }
                }
            }
        }
        
        struct ContentView: View {
            
            @State private var isLightOn: Bool = false
            
            var body: some View {
                VStack {
                    LightBulbView(isOn: $isLightOn)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(isLightOn ? .red : .white)
            }
        }
        
        
