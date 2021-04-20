// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct Cards: Codable {
    let object: String?
    let totalCards: Int
    let hasMore: Bool
    let data: [Data]

    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case data
    }
}

// MARK: - Datum
struct Data: Codable {
    let object, id, oracleID: String?
    let multiverseIDS: [Int]
    let mtgoID, mtgoFoilID, tcgplayerID, cardmarketID: Int?
    let name, lang, releasedAt: String?
    let uri, scryfallURI: String?
    let layout: String?
    let highresImage: Bool
    let imageStatus: String?
    let imageUris: ImageUris
    let manaCost: String?
    let cmc: Int
    let typeLine, oracleText, power, toughness: String?
    let colors, colorIdentity, keywords: [String]?
    let legalities: Legalities
    let games: [String]?
    let reserved, foil, nonfoil, oversized: Bool
    let promo, reprint, variation: Bool
    let datumSet, setName, setType: String?
    let setURI, setSearchURI, scryfallSetURI, rulingsURI: String?
    let printsSearchURI: String?
    let collectorNumber: String?
    let digital: Bool
    let rarity, watermark, cardBackID, artist: String?
    let artistIDS: [String]?
    let illustrationID, borderColor, frame: String?
    let fullArt, textless, booster, storySpotlight: Bool
    let edhrecRank: Int
    let prices: Prices
    let relatedUris: RelatedUris
    let purchaseUris: PurchaseUris

    enum CodingKeys: String, CodingKey {
        case object, id
        case oracleID = "oracle_id"
        case multiverseIDS = "multiverse_ids"
        case mtgoID = "mtgo_id"
        case mtgoFoilID = "mtgo_foil_id"
        case tcgplayerID = "tcgplayer_id"
        case cardmarketID = "cardmarket_id"
        case name, lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case power, toughness, colors
        case colorIdentity = "color_identity"
        case keywords, legalities, games, reserved, foil, nonfoil, oversized, promo, reprint, variation
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity, watermark
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case edhrecRank = "edhrec_rank"
        case prices
        case relatedUris = "related_uris"
        case purchaseUris = "purchase_uris"
    }
}

// MARK: - ImageUris
struct ImageUris: Codable {
    let small, normal, large: String?
    let png: String?
    let artCrop, borderCrop: String?

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}

// MARK: - Legalities
struct Legalities: Codable {
    let standard, future, historic, gladiator: String?
    let pioneer, modern, legacy, pauper: String?
    let vintage, penny, commander, brawl: String?
    let duel, oldschool, premodern: String?
}

// MARK: - Prices
struct Prices: Codable {
    let usd, usdFoil, eur, eurFoil: String?
    let tix: String?

    enum CodingKeys: String, CodingKey {
        case usd
        case usdFoil = "usd_foil"
        case eur
        case eurFoil = "eur_foil"
        case tix
    }
}

// MARK: - PurchaseUris
struct PurchaseUris: Codable {
    let tcgplayer, cardmarket, cardhoarder: String?
}

// MARK: - RelatedUris
struct RelatedUris: Codable {
    let gatherer: String?
    let tcgplayerDecks, edhrec, mtgtop8: String?

    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerDecks = "tcgplayer_decks"
        case edhrec, mtgtop8
    }
}
