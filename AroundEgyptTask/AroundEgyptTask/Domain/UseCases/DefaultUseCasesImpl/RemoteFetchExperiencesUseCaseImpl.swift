//
//  FetchExperiencesUseCaseImpl.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//

class RemoteFetchExperiencesUseCaseImpl:FetchExperiencesUseCase{
    private var remote:ExperiencesRepository
    init(){
        self.remote = ExperiencesRepositoryImpl()
    }
    
    func fetchRecommendedExperiences(completion: @escaping (Result<[ExperienceModel], ErrorMessage>) -> Void) {
        remote.fetchRecommendedExperiences(completion: completion)
    }
    func fetchMostRecentExperiences(completion: @escaping (Result<[ExperienceModel], ErrorMessage>) -> Void) {
        remote.fetchMostRecentExperiences(completion: completion)
    }
    func fetchSingleExperience(id: String, completion: @escaping (Result<ExperienceModel, ErrorMessage>) -> Void) {
        remote.fetchSingleExperience(id: id, completion: completion)
    }
    
    func likeExperience(id: String, completion: @escaping (Result<Int?, ErrorMessage>) -> Void) {
        remote.likeExperience(id: id,completion: completion)
    }
}
