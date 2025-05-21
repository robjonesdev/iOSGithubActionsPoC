import SwiftUI

struct MainContent: View {
    @StateObject private var viewModel = MainContentViewModel(sampleDataRepository: SampleDataRepository())
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else {
                Button(action: {
                    Task {
                        await viewModel.fetchSampleData()
                    }
                }) {
                    Text("Fetch Sample Data")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .padding()
    }
}

#Preview {
    MainContent()
}
