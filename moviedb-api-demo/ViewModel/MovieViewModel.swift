//
//  MovieViewModel.swift
//  moviedb-api-demo
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import Foundation

extension ContentView{
    class ViewModel:ObservableObject{
        @Published var movies: [Movie]? = nil
        
        func load(){
            getMovies(){result in
                switch result {
                    case .success(let movies):
                        DispatchQueue.main.async {
                            self.movies = movies
                          }
                    case .failure(let error):
                        print(error)
                }
            }
        }
        
        func getMovies(handler: @escaping(Result<[Movie], Error>)->Void) {
            let session = URLSession.shared
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=7d01c3430f076b51922ed76b335f01ad")
            if let url = url{
                let task = session.dataTask(with: URLRequest(url: url), completionHandler: {data, response, error in
                    if let data = data{
                        let results = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        if let movies = results?.results {
                            handler(.success(movies))
                        }else{
                            handler(.failure(URLError(.badURL)))
                        }
                    }
                })
                task.resume()
            }
        }
    }
}

