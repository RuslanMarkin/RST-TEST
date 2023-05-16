//
//  Rsttur.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import SwiftUI

struct Rsttur: Codable {
    let data: DataClass
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct DataClass: Codable {
    let geo: Geo
    let categories: [Category]
    let objects: [Object]
}

struct Category: Codable {
    let name: String
    let type: TypeEnum
    let colour: Colour
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case colour = "color"
        case type = "type"
        case name = "name"
        case count = "count"
    }
}

struct Geo: Codable {
    let lat: Double
    let lon: Double
}

struct Object: Codable {
    let name: String
    let description: String
    let image: String
    let type: TypeEnum
    let lat: Double
    let lon: Double
}

enum TypeEnum: String, Codable {
    case child
    case food
    case fun
    case gift
    case infrastructure
    case place
    case shop
}

enum Colour: String, Codable {
    case cyan    = "cyan-10"
    case danger   = "danger-10"
    case info     = "info-10"
    case primary  = "primary-10"
    case success  = "success-10"
    case vio   = "violet-10"
    case warn  = "warning-10"
    
    var hexColor: Color {
        switch self {
        case .cyan:    return Color(hex: "#1A9CA5")
        case .danger:  return Color(hex: "FF3D33")
        case .info:    return Color(hex: "008BCC")
        case .primary: return Color(hex: "1A81FA")
        case .success: return Color(hex: "11A768")
        case .vio:  return Color(hex: "#DCBEE0")
        case .warn: return Color(hex: "EB8C00")
        }
    }
}
