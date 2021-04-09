//
//  MasterView.swift
//  ACLS
//
//  Created by William Entriken on 2021-04-08.
//

import SwiftUI

struct PrimaryView: View {
    var body: some View {
        List {
            ForEach(algorithms, id:\.title) { algorithm in
                NavigationLink(destination: DetailView(algorithm: algorithm)) {
                    AlgorithmView(algorithm: algorithm)
                }
            }
        }
    }

    var sortedAlgorithms: [Algorithm] {
        return algorithms.sorted {$0.title < $1.title}
    }
}

struct AlgorithmView: View { // Inside master view
    var algorithm: Algorithm
    var body: some View {
        VStack(alignment: .leading){
            Text("\(algorithm.title)").font(.headline).fontWeight(.ultraLight)
            Text("\(algorithm.category)").font(.subheadline).fontWeight(.light)
        }
        .padding(.leading)
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
