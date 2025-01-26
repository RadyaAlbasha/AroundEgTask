//
//  ExperienceViewModel.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 26/01/2025.
//

import Foundation
import Combine

class ExperienceViewModel: ObservableObject {
    private var fetchExperiencesUseCase:FetchExperiencesUseCase
    @Published var item: ExperienceModel
    @Published var itemId: String
    @Published var mainImageURL: URL?
    @Published var likeImageName: String
    @Published var isLiked = false
    init(itemId: String) {
        self.fetchExperiencesUseCase = RemoteFetchExperiencesUseCaseImpl()
        self.itemId = itemId
        self.item = ExperienceModel(experienceId: itemId, mainImageURLStr: nil, seenCounterText: "0", name: "", likeCounterText: "0", status: .defaultState)
        self.likeImageName = "heartIcon"
    }
    
    func fetchSingleExperience(){
        //        loadingSubject.send(true)
        fetchExperiencesUseCase.fetchSingleExperience(id: itemId) { [weak self] (result) in
            guard let `self` = self else {return}
            switch result{
            case .success(let experience):
                //                self?.loadingSubject.send(false)
                //                guard let experiences = experiences else{return}
                DispatchQueue.main.async {[weak self] in
                    self?.item = experience
                    if let mainImageURLStr = experience.mainImageURLStr{
            //            self.mainImageURLStr = mainImageURLStr
                        self?.mainImageURL = URL(string: mainImageURLStr)
                    }
                }
                
                //                self?.cacheData()
            case .failure(let error):
                print(error)
                //                self?.loadingSubject.send(false)
                //                self?.errorSubject.send(error.rawValue)
            }
        }
   
    }
    func likeExperience(){
        //        loadingSubject.send(true)
        fetchExperiencesUseCase.likeExperience(id: itemId){ [weak self] (result) in
            guard let `self` = self else {return}
            switch result{
            case .success(let count):
                //                self?.loadingSubject.send(false)
                //                guard let experiences = experiences else{return}
                DispatchQueue.main.async {[weak self] in
                    guard let `self` = self else {return}
                    self.likeImageName = "heartFilledIcon"
                    isLiked = true
                    if let count = count{
                        item.likeCounterText = "\(count)"
                    }
                }
                
                //                self?.cacheData()
            case .failure(let error):
                print(error)
                //                self?.loadingSubject.send(false)
                //                self?.errorSubject.send(error.rawValue)
            }
        }
        
   
    }
    
}
