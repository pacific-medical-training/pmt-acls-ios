//
//  DetailView.swift
//  ACLS
//
//  Created by William Entriken on 2021-04-08.
//

import SwiftUI

struct DetailView: View {
    var algorithm = Algorithm(title: "Acute Coronary Syndromes", fileName: "algo-acs")


    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            PDFViewUI(resourceName: algorithm.fileName)
        }
        .navigationTitle(algorithm.title)
        .background(Color(white: 0, opacity: 0.3))
  //      .navigationBarTitle("👋🏻")
    }

    func displayText() -> String {
        return algorithm.title
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
