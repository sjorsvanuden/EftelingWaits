//
//  RideView.swift
//  EftelingWaits Watch App
//
//  Created by sjorsvanuden on 13/08/2023.
//

import SwiftUI

struct RideView: View {
    let ride: Rides
    
    var body: some View {
            Text(ride.name)
            Text(String(ride.waitTime))
        }
    }

