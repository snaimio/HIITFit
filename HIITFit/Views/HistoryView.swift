
import SwiftUI

struct HistoryView: View {
    
//    let today = Date()
//    let yesterday = Date().addingTimeInterval(-86400) // seconds
//    
//    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
//    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    //let history = HistoryStore()
    @EnvironmentObject var history: HistoryStore
    
    @Binding var showHistory: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { showHistory.toggle() }) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                //Exercise History
                
                Form {
                    ForEach(history.exerciseDays){ day in
                        Section(header:
                                    Text(day.date.formatted(as: "MMM d"))
                            .font(.headline)) {
                                // Section content
                                ForEach(day.exercises, id: \.self) { exercise in
                                    Text(exercise)                        }
                            }
                        
                    }
                }
            }
        }
        
        
        
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(HistoryStore())
}
