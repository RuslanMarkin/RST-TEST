//
//  ToursListView.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import SwiftUI

struct ToursListView: View {
    var viewModel: [TourRowModel] = []
    
    init(model: [TourRowModel]) {
        viewModel = model
    }
    
    var body: some View {
        List(viewModel) { tour in
            TourRowView(tour: tour)
                .onTapGesture { open2Gis(tour.longitude, tour.latitude) }
                .navigationTitle("Объекты")
        }
    }
    
    private func open2Gis(_ longitude: Double, _ latitude: Double) {
        let application = UIApplication.shared
        let appPath = "dgis://2gis.ru/routeSearch/rsType/car/to/\(longitude),\(latitude)"
        let appURL = URL(string: appPath)!
        let appStoreURL = URL(string: "https://apps.apple.com/kz/app/2gis-map-navigation/id481627348")!
        
        if application.canOpenURL(appURL) {
            application.open(appURL, options: [:], completionHandler: nil)
        } else {
            application.open(appStoreURL)
        }
    }
}

