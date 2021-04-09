//
//  Algorithm.swift
//  ACLS
//
//  Created by William Entriken on 2021-04-08.
//

struct Algorithm {
    let category: String = "ACLS"
    let title: String
    let fileName: String
}

let algorithms: [Algorithm] = [
    Algorithm(title: "Acute Coronary Syndromes", fileName: "algo-acs"),
    Algorithm(title: "Cardiac Arrest Circular", fileName: "algo-arrest"),
    Algorithm(title: "Bradycardia With a Pulse", fileName: "algo-bradycardia"),
    Algorithm(title: "Immediate Post-Cardiac Arrest Care", fileName: "algo-postarrest"),
    Algorithm(title: "Stroke Assessment", fileName: "algo-stroke"),
    Algorithm(title: "Tachycardia With a Pulse", fileName: "algo-tachycardia")
]
