//
//  HomeView.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

//import SwiftUI
//import Combine

import SwiftUI
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
   
    @State private var isModalPresented = false // Tracks if the modal is presented

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 25) {
                    welcomeSection
                    recommendedExperiencesSection
                    mostRecentSection
                }
                .padding(.horizontal, 19)
            }
            .onAppear {
                viewModel.fetchRecommendedExperiences()
                viewModel.fetchMostRecentExperiences()
            }
            .sheet(isPresented: $isModalPresented, onDismiss: {
//                viewModel.selectedItem = nil // Reset after dismissing the modal
            }) {
                if let selectedItemId = viewModel.selectedItemId {
                    ExperienceView(itemId: selectedItemId)
//                    ExperienceView(viewModel: ExperienceViewModel(item: selectedItemId))
                }
            }
        }
    }

    // Welcome Section
    private var welcomeSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome!")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.primary)
            
            Text("Now you can explore any experience in 360 degrees and get all the details about it all in one place.")
                .font(.system(size: 21, weight: .regular))
                .foregroundColor(.primary)
        }
    }

    // Recommended Experiences Section
    private var recommendedExperiencesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recommended Experiences")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 7) {
                    ForEach(Array(viewModel.recommendedExperiencesItems.enumerated()), id: \.element.id) { index, item in
                        let isLastItem = index == (viewModel.recommendedExperiencesItems.count - 1)
                        
                        TourismCellView(viewModel: TourismCellViewModel(model: item))
                            .frame(width: UIScreen.main.bounds.width - 46) // Adjust dynamic width
                            .padding(.trailing, isLastItem ? 17 : 0)
                            .onTapGesture {
                                viewModel.selectedItemId = item.experienceId
                                isModalPresented = true
                            }
                    }
                }
            }
            .frame(height: 181)
        }
    }

    // Most Recent Section
    private var mostRecentSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Most Recent")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.primary)
            
            VStack(spacing: 20) {
                ForEach(viewModel.mostRecentItems) { item in
                    TourismCellView(viewModel: TourismCellViewModel(model: item))
                        .onTapGesture {
                            viewModel.selectedItemId = item.experienceId
                            isModalPresented = true
                        }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
