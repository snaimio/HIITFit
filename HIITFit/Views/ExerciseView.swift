
import SwiftUI

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step-up", "Burpee", "Sun Salute"]
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    @State private var timerDone = false
    @State private var showTimer = false
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") {
            showTimer.toggle()
        }
    }
    
    var doneButton: some View {
        Button("Done") {
//            history.addDoneExercise(Exercise.exercises[index].exerciseName)
//            timerDone = false
//            showTimer.toggle()
//            if lastExercise {
//                showSuccess.toggle()
//            }
//            else {
//                selectedTab += 1
//            }
            selectedTab = lastExercise ? 9 : selectedTab + 1
        }
    }
    
    @Binding var selectedTab: Int
    
    let index: Int
    
    let interval: TimeInterval = 3
    
    @State private var showSuccess = false
    
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: exercise.exerciseName)
                    .padding(.bottom)
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.35)
                    .padding(20)
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                HStack(spacing: 150) {
                    startButton
                    doneButton
                }
                .font(.title3)
                .padding()
                RatingView()
                    .padding()
                Spacer()
                Button("History") {
                    
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 0)
        .environmentObject(HistoryStore())
}

