//
//  ContentView.swift
//  moviedb-api-demo
//
//  Created by Ali Eren Çelebi on 11.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            if let movies = viewModel.movies{
                List(movies, id: \.self) { movie in
                    if let title = movie.original_title{
                        Text(title)
                    }
                }
                .navigationBarTitle("Top Movies")
            }
        }
        .onAppear(){
            viewModel.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

