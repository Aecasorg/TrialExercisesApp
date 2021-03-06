//
//  ContentView.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import SwiftUI
import Moya

class ContentViewModel {
    let provider = MoyaProvider<MTCMobileTrialsAPIService>()
    
    func search(searchString: String) {
        provider.request(.search(searchString: searchString)) { result in
            switch result {
            case let .success(response):
                print(response.data)
            case let .failure(error):
                print(error)
            }
        }
    }
}

struct ContentView: View {
    let viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("Search") {
                viewModel.search(searchString: "barc")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
