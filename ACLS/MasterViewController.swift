//
//  MasterViewController.swift
//  ACLS
//
//  Created by Full Decent on 7/7/16.
//  Copyright © 2016 William Entriken. All rights reserved.
//

import UIKit
import QuickLook

struct Algorithm {
    let category: String
    let title: String
    let fileName: String
}

let algorithms: [Algorithm] = [
    Algorithm(category: "ACLS", title: "Acute Coronary Syndromes", fileName: "algo-acs.pdf"),
    Algorithm(category: "ACLS", title: "Cardiac Arrest Circular", fileName: "algo-arrest.pdf"),
    Algorithm(category: "ACLS", title: "Bradycardia With a Pulse", fileName: "algo-bradycardia.pdf"),
    Algorithm(category: "ACLS", title: "Immediate Post-Cardiac Arrest Care", fileName: "algo-postarrest.pdf"),
    Algorithm(category: "ACLS", title: "Stroke Assessment", fileName: "algo-stroke.pdf"),
    Algorithm(category: "ACLS", title: "Tachycardia With a Pulse", fileName: "algo-tachycardia.pdf")
]

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previewController = QLPreviewController()
        let dataSource = QLPreviewControllerSimpleDataSource(fileName: "algo-acs")
        previewController.dataSource = dataSource
        previewController.delegate = self
        let wrapperNavigationController = UINavigationController(rootViewController: previewController)
        self.splitViewController!.showDetailViewController(wrapperNavigationController, sender: self)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithms.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let algorithm = algorithms[indexPath.row]
        cell.textLabel!.text = algorithm.title
        return cell
    }
}

extension MasterViewController: QLPreviewControllerDelegate {
    
}

extension MasterViewController: QLPreviewControllerDataSource {
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