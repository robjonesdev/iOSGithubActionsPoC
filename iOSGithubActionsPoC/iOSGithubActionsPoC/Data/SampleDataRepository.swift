//
//  SampleDataRepository.swift
//  iOSGithubActionsPoC
//
//  Created by Jones, Robert on 5/21/25.
//


class SampleDataRepository {
    func fetchNewSampleData(count: Int) async throws -> [String] {
        if count < 1 {
           return []
        }
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return (0..<count).map { "New Value: \($0)" }
    }
}
