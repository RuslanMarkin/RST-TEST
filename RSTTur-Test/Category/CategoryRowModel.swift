//
//  CategoryRowModel.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import SwiftUI

final class CategoryRowModel: ObservableObject, Identifiable {
    
    let category: Category
    
    var name: String { category.name }
    var type: TypeEnum { category.type }
    var color: Colour { category.colour }
    var count: Int { category.count }
    
    
    init(category: Category) {
        self.category = category
    }
}
