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
    @Published var searchString: String = ""
    
    var players: [Player] { searchResult?.players ?? [] }
    var teams: [Team] { searchResult?.teams ?? [] }
    
    func search() {
        provider.request(.search(searchString: self.searchString)) { result in
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
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $viewModel.searchString)
                    Button("Search") {
                        viewModel.search()
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.gray)
                    .cornerRadius(8)
                }
                .padding()
                
                List {
                    Section(header: Text("Players")) {
                        ForEach(viewModel.players) { player in
                            PlayerView(player: player)
                        }
                    }
                    
                    Section(header: Text("Teams")) {
                        ForEach(viewModel.teams) { team in
                            TeamView(team: team)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Football Search")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
