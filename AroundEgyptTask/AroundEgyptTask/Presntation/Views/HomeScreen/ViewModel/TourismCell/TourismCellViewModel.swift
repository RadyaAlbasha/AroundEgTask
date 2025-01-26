//
//  TourismCellViewModel.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 26/01/2025.
//

import Foundation
import Combine

class TourismCellViewModel: ObservableObject {
    @Published var cellModel: TourismCellModel
    @Published var mainImageURL: URL?

    init(model: TourismCellModel) {
        self.cellModel = model
        if let mainImageURLStr = model.mainImageURLStr{

            self.mainImageURL = URL(string: mainImageURLStr)
        }
    }
}
