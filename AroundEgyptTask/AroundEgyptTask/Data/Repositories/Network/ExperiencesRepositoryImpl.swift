//
//  ExperiencesRepositoryImpl.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//
import Combine
class ExperiencesRepositoryImpl : ExperiencesRepository {
    
     var cancellables = Set<AnyCancellable>()
    func fetchRecommendedExperiences(completion: @escaping (Result<[ExperienceModel], ErrorMessage>) -> Void) {
        NetworkManager.shared.request(APIConstants.fullURL(for: APIConstants.Endpoints.fetchRecommendedExperiences))
            .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { (response: ExperiencesResponse) in
//                ExperienceModel
               let cellModels = response.data?.map { datum in
                   ExperienceModel(experienceId: datum.id, mainImageURLStr: datum.coverPhoto, seenCounterText:"\(datum.viewsNo)", name: datum.title, likeCounterText: "\(datum.likesNo)", status: .recomended, description: datum.description, city: datum.city)
                } ?? []
                completion(.success(cellModels))
                print(response)
            })
            .store(in: &cancellables)
    }
    func fetchMostRecentExperiences(completion: @escaping (Result<[ExperienceModel], ErrorMessage>) -> Void) {
        NetworkManager.shared.request(APIConstants.fullURL(for: APIConstants.Endpoints.fetchRecentExperiences))
            .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { (response: ExperiencesResponse) in
//                ExperienceModel
                let cellModels : [ExperienceModel] = response.data?.map { datum in
                   var status = ExperienceStatus.defaultState
                   if datum.recommended == 1 {
                       status = .recomended
                   }
                    return ExperienceModel(experienceId: datum.id, mainImageURLStr: datum.coverPhoto, seenCounterText:"\(datum.viewsNo)", name: datum.title, likeCounterText: "\(datum.likesNo)", status: status, description: datum.description, city: datum.city)
                } ?? []
                completion(.success(cellModels))
                print(response)
            })
            .store(in: &cancellables)
    }
    
    func fetchSingleExperience(id: String, completion: @escaping (Result<ExperienceModel, ErrorMessage>) -> Void) {
        NetworkManager.shared.request(APIConstants.fullURL(for: APIConstants.Endpoints.fetchSingleExperience(id: id)))
            .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { (response: SingleExperiencesResponse) in
//                ExperienceModel
                if let datum = response.data{
                    var status = ExperienceStatus.defaultState
                    if datum.recommended == 1 {
                        status = .recomended
                    }
                    let model =  ExperienceModel(experienceId: datum.id, mainImageURLStr: datum.coverPhoto, seenCounterText:"\(datum.viewsNo)", name: datum.title, likeCounterText: "\(datum.likesNo)", status: status, description: datum.description, city: datum.city)
                    completion(.success(model))
                }else{
                    completion(.failure(.NO_DATA))
                }
            
                
                print(response)
            })
            .store(in: &cancellables)
    }
    
    func likeExperience(id: String, completion: @escaping (Result<Int?, ErrorMessage>) -> Void) {
        NetworkManager.shared.request(APIConstants.fullURL(for: APIConstants.Endpoints.likeExperience(id: id)), method: .post)
            .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { (response: LikeExperienceResponse) in
                completion(.success(response.data))
                print(response)
            })
            .store(in: &cancellables)
    }
}
