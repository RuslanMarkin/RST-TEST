//
//  CategoryRowView.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import SwiftUI

struct CategoryRowView: View {
    @ObservedObject var category: CategoryRowModel
    var body: some View {
        HStack {
            Text(category.name)
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(category.color.hexColor)
                    .frame(width: 30, height: 30, alignment: .center)
                Text("\(category.count)")
            }
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: CategoryRowModel(category: Category(name: "Интересные места", type: .food, colour: .cyan, count: 15)))
    }
}


