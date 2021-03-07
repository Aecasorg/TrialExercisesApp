//
//  MainView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import SwiftUI
import Moya

class MainViewModel: ObservableObject {
    let provider = MoyaProvider<APIService>()
    @Published var searchResult: SearchResponse.Result? = nil
    var searchString: String = "barc"
    
    var players: [Player] { searchResult?.players ?? [] }
    
    func search(searchString: String) {
        provider.request(.search(searchString: searchString)) { result in
            switch result {
            case let .success(response):
                do {
                    self.searchResult = try JSONDecoder().decode(SearchResponse.self, from: response.data).result
                } catch {
                    fatalError("Error decoding result")
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

struct MainView: View {
    let viewModel = MainViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.players) { player in
                PlayerView(player: player)
            }
            Spacer()
            Button("Search") {
                viewModel.search(searchString: "barc")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
