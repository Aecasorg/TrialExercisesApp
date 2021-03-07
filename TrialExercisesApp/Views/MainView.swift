//
//  MainView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import SwiftUI

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
