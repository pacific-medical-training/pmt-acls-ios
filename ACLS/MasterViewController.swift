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
    Algorithm(category: "ACLS", title: "Acute Coronary Syndromes", fileName: "algo-acs"),
    Algorithm(category: "ACLS", title: "Cardiac Arrest Circular", fileName: "algo-arrest"),
    Algorithm(category: "ACLS", title: "Bradycardia With a Pulse", fileName: "algo-bradycardia"),
    Algorithm(category: "ACLS", title: "Immediate Post-Cardiac Arrest Care", fileName: "algo-postarrest"),
    Algorithm(category: "ACLS", title: "Stroke Assessment", fileName: "algo-stroke"),
    Algorithm(category: "ACLS", title: "Tachycardia With a Pulse", fileName: "algo-tachycardia")
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

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        previewController.currentPreviewItemIndex = indexPath.row
        let wrapperNavigationController = UINavigationController(rootViewController: previewController)
        self.splitViewController!.showDetailViewController(wrapperNavigationController, sender: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let algorithm = algorithms[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = algorithm.title
        return cell
    }
}

extension MasterViewController: QLPreviewControllerDelegate {
    
}

extension MasterViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return algorithms.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let mainbundle = Bundle.main
        let url = mainbundle.path(forResource: algorithms[index].fileName, ofType: "pdf")!
        print(url)
        let doc = URL(fileURLWithPath: url)
        return doc as QLPreviewItem
    }
}
