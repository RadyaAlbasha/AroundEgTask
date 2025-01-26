//
//  TourismCellView.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI
struct TourismCellView: View {
    @ObservedObject var viewModel: TourismCellViewModel

    @State private var loadedImage: Image? = nil
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                WebImage(url: viewModel.mainImageURL) { image in
                    image.resizable()
                } placeholder: {
//                        Rectangle().foregroundColor(.gray)
                    Image("imagePlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 154)
                        .cornerRadius(15)
                        .clipped()
                }
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                .indicator(.activity) // Activity Indicator
                .aspectRatio(contentMode: .fill)
                .frame(height: 154)
                .cornerRadius(15)
                .clipped()

                
                // 360 Image at the Center
                Image(viewModel.cellModel._360Icon)
                    .resizable()
                    .frame(width: 37, height: 37)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                // left Label and Icon
                HStack {
                    Image(viewModel.cellModel.seenIcon)
                        .resizable()
                        .frame(width: 15, height: 10)
                        .padding(10)
                    Text(viewModel.cellModel.seenCounterText)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                }
                //left bottom Corner Icon
                
                
                //right bottom Corner Icon
                Image(viewModel.cellModel.imageIcon)
                    .resizable()
                    .frame(width: 21, height: 16)
                    .padding(9)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
                //right top Corner Icon
                Image(viewModel.cellModel.infoIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.top, 7)
                    .padding(.trailing, 12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
            
            // Labels and Icon
            HStack {
                // Left Label
                Text(viewModel.cellModel.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                // Right Label and Icon
                HStack {
                    Text(viewModel.cellModel.likeCounterText)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primary)
                    Image(viewModel.cellModel.likeIcon)
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(height: 181) // Set the overall cell height to 181
//        .padding(.horizontal, 18.0)
    }
}


#Preview {
    TourismCellView(viewModel: TourismCellViewModel(model: TourismCellModel(experienceId: "", mainImageURLStr: nil, seenCounterText: "0", name: "", likeCounterText: "0", status: .defaultState)))
}
