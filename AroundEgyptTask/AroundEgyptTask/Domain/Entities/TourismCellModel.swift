//
//  TourismCellModel.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

import Foundation


struct TourismCellModel: Identifiable{
    let id = UUID()
    let experienceId: String
    var mainImageURLStr: String?
    let mainImagePlaceholder: String
    let infoIcon: String
    let _360Icon: String
    let imageIcon: String
    let seenIcon: String
    let seenCounterText: String
    let name: String
    let likeIcon: String
    let likeCounterText: String
    let status: ExperienceStatus
    

    
    
    // Default values for icons
    internal init(experienceId: String, mainImageURLStr: String?, mainImagePlaceholder: String = "imagePlaceholder", infoIcon: String = "infoIcon", _360Icon: String = "360DegreeIcon", imageIcon: String = "photoIcon", seenIcon: String = "eyeIcon", seenCounterText: String, name: String, likeIcon: String = "heartFilledIcon", likeCounterText: String, status: ExperienceStatus) {
        self.experienceId = experienceId
        self.mainImageURLStr = mainImageURLStr
        self.mainImagePlaceholder = mainImagePlaceholder
        self.infoIcon = infoIcon
        self._360Icon = _360Icon
        self.imageIcon = imageIcon
        self.seenIcon = seenIcon
        self.seenCounterText = seenCounterText
        self.name = name
        self.likeIcon = likeIcon
        self.likeCounterText = likeCounterText
        self.status = status
    }
}
