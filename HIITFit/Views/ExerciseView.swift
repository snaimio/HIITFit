
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
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
            timerDone = false
            showTimer.toggle()
            if lastExercise {
                            showSuccess.toggle()
                        }
                        else {
                            selectedTab += 1
                        }
            // history.addDoneExercise(Exercise.exercises[index].exerciseName)
//            timerDone = false
//            showTimer.toggle()
//            if lastExercise {
//                showSuccess.toggle()
//            }
//            else {
//                selectedTab += 1
//            }
            //selectedTab = lastExercise ? 9 : selectedTab + 1
        }
    }
    
    @Binding var selectedTab: Int
    
    let index: Int
    
    let interval: TimeInterval = 3
    
    @State private var showSuccess = false
    
    @EnvironmentObject var history: HistoryStore
    
    @State private var rating = 0
    
    @State private var showHistory = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.35)
                    .padding(20)
                if showTimer {
                    TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
                }
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()
                RatingView(rating: $rating)
                    .padding()
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
    ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
}

