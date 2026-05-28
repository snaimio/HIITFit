
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
  var body: some View {
      TabView(selection: $selectedTab) {
          WelcomeView(selectedTab: $selectedTab) // was Text("Welcome")
          ForEach(Exercise.exercises.indices, id: \.self) { index in
              ExerciseView(selectedTab: $selectedTab, index: index) // was Text("Exercise 1")
                  .tag(index)
          }
      }
      .environmentObject(HistoryStore())
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

#Preview {
  ContentView()
}
