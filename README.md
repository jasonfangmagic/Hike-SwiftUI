# 1. @State You can make the struct mutable 

A property wrapper type that can read and write a value managed by SwiftUI.
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

