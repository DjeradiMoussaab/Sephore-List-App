//
//  Product.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//


struct Product: Decodable {
        
    enum CodingKeys: String, CodingKey {
        
        case id = "product_id"
        case name = "product_name"
        case description
        case price
        case image = "images_url"
        case brand = "c_brand"
        case isSpecial = "is_special_brand"
    }
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let image: Image
    let brand: Brand
    let isSpecial: Bool


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        price = try container.decode(Double.self, forKey: .price)
        image = try container.decode(Image.self, forKey: .image)
        brand = try container.decode(Brand.self, forKey: .brand)
        isSpecial = try container.decode(Bool.self, forKey: .isSpecial)
    }
    
}

struct Image: Decodable {
    enum CodingKeys: String, CodingKey {
        case small
        case large
    }
    
    let small: String
    let large: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(String.self, forKey: .small)
        large = try container.decode(String.self, forKey: .large)
    }
    
}

struct Brand: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    let id: String
    let name: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
    
}

