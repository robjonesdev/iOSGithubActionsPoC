import XCTest
@testable import iOSGithubActionsPoC

final class SampleDataRepositoryTests: XCTestCase {
    private var repository: SampleDataRepository!

    override func setUp() {
        super.setUp()
        repository = SampleDataRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    func test_repositoryEmitsCorrectNumberOfItems() async throws {
        let fetchAmount = 3
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        XCTAssertEqual(results.count, fetchAmount, "The number of emitted items should match the fetch amount.")
    }

    func test_repositoryEmitsValuesInExpectedFormat() async throws {
        let fetchAmount = 2
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        
        for i in 0..<fetchAmount {
            XCTAssertEqual(results[i], "New Value: \(i)", "The emitted value at index \(i) is not in the expected format.")
        }
    }

    func test_repositoryWithZeroFetchAmountEmitsZeroItems() async throws {
        let fetchAmount = 0
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        XCTAssertTrue(results.isEmpty, "The repository should emit zero items when fetch amount is zero.")
    }

    func test_repositoryWithNegativeFetchAmountEmitsNothing() async throws {
        let fetchAmount = -1
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        XCTAssertTrue(results.isEmpty, "The repository should emit nothing when fetch amount is negative.")
    }

    func test_fetchNewSampleDataEmitsCorrectNumberOfItems() async throws {
        let fetchAmount = 3
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        XCTAssertEqual(results.count, fetchAmount, "The number of emitted items should match the fetch amount.")
    }

    func test_fetchNewSampleDataEmitsValuesInExpectedFormat() async throws {
        let fetchAmount = 3
        let results = try await repository.fetchNewSampleData(count: fetchAmount)
        
        for i in 0..<fetchAmount {
            XCTAssertEqual(results[i], "New Value: \(i)", "The emitted value at index \(i) is not in the expected format.")
        }
    }
}
