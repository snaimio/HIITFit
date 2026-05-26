
import SwiftUI

struct RatingView: View {
    var body: some View {
        
        HStack {
            ForEach(0 ..< 5) { item in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView()
}
