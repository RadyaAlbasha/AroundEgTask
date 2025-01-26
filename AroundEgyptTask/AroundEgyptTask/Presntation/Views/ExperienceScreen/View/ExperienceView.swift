//
//  ExperienceView.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 26/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI
struct ExperienceView: View {
    @StateObject private var viewModel: ExperienceViewModel
   
    init(itemId: String) {
        _viewModel = StateObject(wrappedValue: ExperienceViewModel(itemId: itemId))
    }
    var body: some View {
        
        ScrollView {
                   VStack(alignment: .leading) {
                       
                       WebImage(url: viewModel.mainImageURL) { image in
                           image.resizable()
                               
                               .clipped()
                       } placeholder: {
       //                        Rectangle().foregroundColor(.gray)
                           Image("imagePlaceholder")
                               .resizable()
//                               .aspectRatio(contentMode: .fill)
                               .frame(height: 285)
                               .clipped()
                               .padding(.top, 0)

                       }
                       .onSuccess { image, data, cacheType in
                           // Success
                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                       }
                       .indicator(.activity) // Activity Indicator
                       
//                       .aspectRatio(contentMode: .fill)
                       .frame(height: 285)
                       .clipped()
                       .padding(.top, 0)

                       HStack {
                                   // Left side: VStack with Title and Description
                                   VStack(alignment: .leading, spacing: 5) {
                                       Text(viewModel.item.name)
                                           .font(.system(size: 16, weight: .bold))
                                           .foregroundColor(.primary)
                                       Text(viewModel.item.city?.name ?? "")
                                           .font(.system(size: 16, weight: .semibold))
                                           .foregroundColor(.secondary)
                                   }
                                   .padding(.leading, 18)

                                   Spacer()
                                   
                                   // Right side: Icons
                                   HStack(spacing: 15) {
                                       Image("shareIcon")
                                       Image(viewModel.likeImageName)
                                           .onTapGesture {
                                               if !viewModel.isLiked{
                                                   viewModel.likeExperience()
                                               }
                                           }
                                       
                                       Text(viewModel.item.likeCounterText)
                                           .font(.system(size: 14, weight: .semibold))
                                           .foregroundColor(.primary)
                                           
                                       
                                   }
                                   .padding(.trailing)
                           
                       .padding(.horizontal, 15)
                   }
                   .padding(.horizontal, 0)
                       
                       Divider()
                           .padding(.top, 15)
                           .padding(.bottom, 15)
                           .padding(.horizontal, 17)// Gray separator
                       
                       
                       Text("Description")
                           .font(.system(size: 22, weight: .semibold))
                           .foregroundColor(.primary)
                           .padding(.horizontal, 15)
                           
                       Text(viewModel.item.description)
                           .font(.system(size: 14, weight: .regular))
                           .foregroundColor(.primary)
                           .padding(.horizontal, 15)
                          
                   }
        }.onAppear(){
            viewModel.fetchSingleExperience()
        }.padding(.horizontal, 0)
    }
}

#Preview {
    ExperienceView(itemId:"")
}
