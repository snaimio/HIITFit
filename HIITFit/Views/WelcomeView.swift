
import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    
    @State private var showHistory = false
    
    var body: some View {
        ZStack {
            VStack{
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get Fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(Circle())
                        
                }
                Button(action: { selectedTab = 0}) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                    //Label("Get Started", systemImage: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
            }
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
