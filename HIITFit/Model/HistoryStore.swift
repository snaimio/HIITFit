import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID() // creates a unique identifier
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
    
    func addDoneExercise(_ exerciseName: String) {
        
    }
}


