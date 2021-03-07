//
//  TeamView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 07/03/2021.
//

import SwiftUI
struct TeamView: View {
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(team.name)")
                .font(.headline)
                .padding(.bottom, 1)
            
            HStack {
                Text("City: \(team.city)")
                Spacer()
                Text("Stadium: \(team.stadium)")
            }
            .font(.caption)
        }
        .padding()
    }
}

struct TeamView_Previews: PreviewProvider {
    static var team = Team.data[0]
    
    static var previews: some View {
        TeamView(team: team)
            .previewLayout(.sizeThatFits)
    }
}
