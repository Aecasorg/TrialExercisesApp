//
//  FavouritePlayersView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 07/03/2021.
//

import SwiftUI

class FavouritesViewModel: ObservableObject {
    // TODO: Move data handling from view into here (if possible)
}

struct FavouritePlayersView: View {
    @StateObject var viewModel = FavouritesViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(entity: FavouritePlayer.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FavouritePlayer.firstName, ascending: true)]) var players: FetchedResults<FavouritePlayer>
    
    func removePlayer(at offsets: IndexSet) {
        for index in offsets {
            let player = players[index]
            managedObjectContext.delete(player)
            PersistenceController.shared.save()
        }
    }
    
    var body: some View {
        List {
            if players.isEmpty {
                HStack {
                    Spacer()
                    Text("No favourite players saved")
                    Spacer()
                }
            }
            
            ForEach(players, id: \.self) { player in
                VStack(alignment: .leading) {
                    Text("\(player.firstName ?? "Unknown") \(player.surname ?? "Unknown")")
                        .font(.headline)
                        .padding(.bottom, 1)
                    
                    HStack {
                        Text("Age: \(player.age ?? "Unknown")")
                        Spacer()
                        Text("Club: \(player.club ?? "Unknown")")
                    }
                    .font(.caption)
                }
                .padding()
            }
            .onDelete { indexSet in
                removePlayer(at: indexSet)
            }
        }
    }
}

struct FavouritePlayersView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritePlayersView()
    }
}
