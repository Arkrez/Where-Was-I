//
//  DataModel.swift
//  Where Was I
//
//  Created by Kira Rodriguez on 11/10/20.
//  Copyright © 2020 ArklightStudios. All rights reserved.
//

import Foundation

class VisitedPoint {
    var latitude: String
    var longitude: String
    init(lat: String, long: String) {
        self.latitude = lat
        self.longitude = long
    }
}
