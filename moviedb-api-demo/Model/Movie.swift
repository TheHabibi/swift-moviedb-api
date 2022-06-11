//
//  Movie.swift
//  moviedb-api-demo
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import Foundation

struct MovieApiResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Hashable {
    
    let original_title: String?

    let release_date: String?

}


