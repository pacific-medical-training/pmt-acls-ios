//
//  PDFViewUI.swift
//  ACLS
//
//  Created by William Entriken on 2021-04-08.
//

import SwiftUI
import PDFKit

// https://blog.techchee.com/pdf-composer-app-swiftui/
// https://stackoverflow.com/a/65741019/300224
struct PDFViewUI : UIViewRepresentable {
    private var resourceName: String?
    private let autoScales : Bool
    init(resourceName: String?, autoScales : Bool = true ) {
        self.resourceName = resourceName
        self.autoScales = autoScales
    }
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales =  self.autoScales
        if let resourceName = self.resourceName {
            guard let path = Bundle.main.url(forResource: resourceName, withExtension: "pdf") else { return pdfView }
            if let document = PDFDocument(url: path) {
                pdfView.document = document
            }
        }
        return pdfView
    }
    func updateUIView(_ uiView: PDFView, context: Context) {
        // Empty
    }
}

struct PDFViewUI_Previews: PreviewProvider {
    static var previews: some View {
        PDFViewUI(resourceName: "algo-acs")
    }
}
