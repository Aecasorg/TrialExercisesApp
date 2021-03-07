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
    var searchString: String = ""
    var showNoResult = false
    
    var players: [Player] { searchResult?.players ?? [] }
    var teams: [Team] { searchResult?.teams ?? [] }
    
    var playerOffset: Int = 10
    var teamsOffset: Int = 10
    
    var showMorePlayersButton: Bool { players.count == playerOffset }
    var showMoreTeamsButton: Bool { teams.count == teamsOffset }
    
    func search() {
        provider.request(.search(searchString: self.searchString)) { result in
            switch result {
            case let .success(response):
                do {
                    self.searchResult = try JSONDecoder().decode(SearchResponse.self, from: response.data).result
                    self.updateShowNoResult()
                } catch {
                    fatalError("Error decoding result")
                }
            case let .failure(error):
                print(error)
            }
        }
        
        resetOffsets()
    }
    
    func searchMorePlayers() {
        provider.request(.searchType(searchString: self.searchString, searchType: .players, offset: playerOffset + 10)) { result in
            switch result {
            case let .success(response):
                do {
                    if let playerArray = try JSONDecoder().decode(SearchResponse.self, from: response.data).result.players {
                        self.searchResult?.players?.append(contentsOf: playerArray)
                    }
                    self.updateShowNoResult()
                } catch {
                    fatalError("Error decoding player result")
                }
            case let .failure(error):
                print(error)
            }
        }
        
        playerOffset += 10
    }
    
    func searchMoreTeams() {
        provider.request(.searchType(searchString: self.searchString, searchType: .teams, offset: teamsOffset + 10)) { result in
            switch result {
            case let .success(response):
                do {
                    if let teamsArray = try JSONDecoder().decode(SearchResponse.self, from: response.data).result.teams {
                        self.searchResult?.teams?.append(contentsOf: teamsArray)
                    }
                    self.updateShowNoResult()
                } catch {
                    fatalError("Error decoding teams result")
                }
            case let .failure(error):
                print(error)
            }
        }
        
        teamsOffset += 10
    }
    
    func resetOffsets() {
        playerOffset = 10
        teamsOffset = 10
    }
    
    func updateShowNoResult() {
        showNoResult = players.isEmpty && teams.isEmpty
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
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Button("Search") {
                        viewModel.search()
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.gray)
                    .cornerRadius(8)
                }
                .padding()
                
                if viewModel.showNoResult {
                    Text("No results found")
                }
                
                List {
                    if viewModel.players.isEmpty == false {
                        Section(header: Text("Players")) {
                            ForEach(viewModel.players) { player in
                                PlayerView(player: player)
                            }
                            
                            if viewModel.showMorePlayersButton {
                                HStack {
                                    Spacer()
                                    
                                    Button("More players...") {
                                        viewModel.searchMorePlayers()
                                    }
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    if viewModel.teams.isEmpty == false {
                        Section(header: Text("Teams")) {
                            ForEach(viewModel.teams) { team in
                                TeamView(team: team)
                            }
                            
                            if viewModel.showMoreTeamsButton {
                                HStack {
                                    Spacer()
                                    
                                    Button("More teams...") {
                                        viewModel.searchMoreTeams()
                                    }
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                                    
                                    Spacer()
                                }
                            }
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
