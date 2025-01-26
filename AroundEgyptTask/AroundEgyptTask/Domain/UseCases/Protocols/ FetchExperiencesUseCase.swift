//
//   FetchExperiencesUseCase.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//

protocol FetchExperiencesUseCase{
    func fetchRecommendedExperiences(completion: @escaping (Result<[ExperienceModel],ErrorMessage>) -> Void)
    func fetchMostRecentExperiences(completion: @escaping (Result<[ExperienceModel],ErrorMessage>) -> Void)
    func fetchSingleExperience(id: String, completion: @escaping (Result<ExperienceModel,ErrorMessage>) -> Void)
    func likeExperience(id: String, completion: @escaping (Result<Int?, ErrorMessage>) -> Void)
}

