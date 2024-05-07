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

# 2. Use $ to bind the var with toggle

A property wrapper type that can read and write a value owned by a source of truth. <br>
https://developer.apple.com/documentation/swiftui/binding

        struct ContentView: View {
            
           @State private var isOn: Bool = false
            
            var body: some View {
                VStack {
                    Toggle(isOn: $isOn, label: {
                        Text("OFF")
                    }).fixedSize()
                }
            }
        }

