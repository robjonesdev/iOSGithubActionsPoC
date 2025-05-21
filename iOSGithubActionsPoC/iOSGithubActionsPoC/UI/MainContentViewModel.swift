import Foundation
import Combine

class MainContentViewModel: ObservableObject {
    private let sampleDataRepository: SampleDataRepository

    @Published var isLoading: Bool = false
    
    init(sampleDataRepository: SampleDataRepository) {
        self.sampleDataRepository = sampleDataRepository
    }
    
    func fetchSampleData() async {
        isLoading = true
        
        do {
            let data = try await sampleDataRepository.fetchNewSampleData(count: 3)
            print("Fetched data [\(data)]")
        } catch {
            print("Error fetching data: \(error)")
        }
        
        isLoading = false
    }
}
