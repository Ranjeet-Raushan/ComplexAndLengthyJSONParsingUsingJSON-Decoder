//  Models.swift
//  ComplexAndLengthyJSONParsingUsingJSON-Decoder
//  Created by Ranjeet Raushan on 29/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.


import Foundation
struct Result : Codable {
    let items : Items?

    enum CodingKeys: String, CodingKey {

        case items = "items"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent(Items.self, forKey: .items)
    }
}

struct Items : Codable {
    let item : [Item]?
    enum CodingKeys: String, CodingKey {
        case item = "item"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        item = try values.decodeIfPresent([Item].self, forKey: .item)
    }
}


struct Item : Codable {
    let id : String?
    let type : String?
    let name : String?
    let ppu : Double?
    let batters : Batters?
    let topping : [Topping]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case name = "name"
        case ppu = "ppu"
        case batters = "batters"
        case topping = "topping"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        ppu = try values.decodeIfPresent(Double.self, forKey: .ppu)
        batters = try values.decodeIfPresent(Batters.self, forKey: .batters)
        topping = try values.decodeIfPresent([Topping].self, forKey: .topping)
    }

}
struct Batters : Codable {
    let batter : [Batter]?

    enum CodingKeys: String, CodingKey {

        case batter = "batter"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        batter = try values.decodeIfPresent([Batter].self, forKey: .batter)
    }

}

struct Batter : Codable {
    let id : String?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}

struct Topping : Codable {
    let id : String?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
