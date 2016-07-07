//
//  QLPreviewControllerSimpleDataSource.swift
//  ACLS
//
//  Created by Full Decent on 7/7/16.
//  Copyright © 2016 William Entriken. All rights reserved.
//

import Foundation
import QuickLook

/// For a file in the current bundle
@objc class QLPreviewControllerSimpleDataSource: NSObject, QLPreviewControllerDataSource {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(controller: QLPreviewController, previewItemAtIndex index: Int) -> QLPreviewItem {
        let mainbundle = NSBundle.mainBundle()
        let url = mainbundle.pathForResource("algo-acs", ofType: "pdf")!
        print(url)
        let doc = NSURL(fileURLWithPath: url)
        return doc
    }
}