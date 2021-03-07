//
//  PlayerView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 07/03/2021.
//

import SwiftUI

struct PlayerView: View {
    let player: Player
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(player.firstName) \(player.surname)")
                .font(.headline)
                .padding(.bottom, 1)
            
            HStack {
                Text("Age: \(player.age)")
                Spacer()
                Text("Club: \(player.club)")
            }
            .font(.caption)
        }
        .padding()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var player = Player.data[0]
    
    static var previews: some View {
        PlayerView(player: player)
            .previewLayout(.sizeThatFits)
    }
}
