//
//  CategoryListView.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel = CategoryViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    categories
                }
            }
            .alert(item: $viewModel.error, content: { e -> Alert in
                Alert(
                    title: Text("Unable to load Data"),
                    message: Text(e.error.description),
                    primaryButton: .default(Text("Retry"), action: {
                        self.viewModel.fetch()
                    }),
                    secondaryButton: .cancel()
                )
            })
            .navigationTitle("Категории")
        }
    }
    
    private var categories: some View {
        List(viewModel.categories) { category in
            NavigationLink(
                destination: ToursListView(model: viewModel.tours.filter { $0.type == category.type }),
                label: {
                    CategoryRowView(category: category)
                })
        }
    }
}

