//
//  HomeViewModel.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var fetchExperiencesUseCase:FetchExperiencesUseCase
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        self.fetchExperiencesUseCase = RemoteFetchExperiencesUseCaseImpl()
        
        recommendedExperiencesSubject
                    .sink { [weak self] items in
                        DispatchQueue.main.async  { [weak self] in
                            self?.recommendedExperiencesItems = items.map({ model in
                                TourismCellModel(experienceId: model.experienceId, mainImageURLStr: model.mainImageURLStr, seenCounterText: model.seenCounterText, name: model.name, likeCounterText: model.likeCounterText, status: model.status)
                            }) // Update the recommendedExperiencesItems when the subject emits a new value
                        }
                    }
                    .store(in: &cancellables)
        
        mostRecentSubject.sink { [weak self] items in
            DispatchQueue.main.async  { [weak self] in
                self?.mostRecentItems = items.map({ model in
                    TourismCellModel(experienceId: model.experienceId, mainImageURLStr: model.mainImageURLStr, seenCounterText: model.seenCounterText, name: model.name, likeCounterText: model.likeCounterText, status: model.status)
                }) // Update the mostRecentItems when the subject emits a new value
            }
        }
        .store(in: &cancellables)
        
    }
    //verticalItems
    @Published var recommendedExperiencesItems: [TourismCellModel] = []
    
    //horizontalItems
    @Published var mostRecentItems: [TourismCellModel] = []
    
    @Published var selectedItem: TourismCellModel? // Holds the selected item for the modal
    @Published var selectedItemId: String?
    
    var recommendedExperiencesSubject = PassthroughSubject<[ExperienceModel],Never>()
    var mostRecentSubject = PassthroughSubject<[ExperienceModel],Never>()
    
    func fetchRecommendedExperiences(){
        //        loadingSubject.send(true)
        fetchExperiencesUseCase.fetchRecommendedExperiences { [weak self] (result) in
            guard let `self` = self else {return}
            switch result{
            case .success(let experiences):
                //                self?.loadingSubject.send(false)
                //                guard let experiences = experiences else{return}
                recommendedExperiencesSubject.send(experiences)
                //                self?.cacheData()
            case .failure(let error):
                print(error)
                //                self?.loadingSubject.send(false)
                //                self?.errorSubject.send(error.rawValue)
            }
        }
    }
    func fetchMostRecentExperiences(){
        //        loadingSubject.send(true)
        fetchExperiencesUseCase.fetchMostRecentExperiences { [weak self] (result) in
            guard let `self` = self else {return}
            switch result{
            case .success(let experiences):
                //                self?.loadingSubject.send(false)
                //                guard let experiences = experiences else{return}
                mostRecentSubject.send(experiences)
                //                self?.cacheData()
            case .failure(let error):
                print(error)
                //                self?.loadingSubject.send(false)
                //                self?.errorSubject.send(error.rawValue)
            }
        }
    }
    
    

}
