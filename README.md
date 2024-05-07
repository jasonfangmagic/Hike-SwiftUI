# 1. @State You can make the struct mutable 

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

