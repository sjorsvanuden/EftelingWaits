//
//  ContentView.swift
//  EftelingWaits Watch App
//
//  Created by sjorsvanuden on 13/08/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var queue = QueueViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text("Refresh").frame(width: 180.0, height: 50.0).background(Color.blue.cornerRadius(20)).foregroundColor(.white).onTapGesture {
                    queue.getQueues()                }
                List(queue.rides) { ride in
                    NavigationLink {
                        RideView(ride: ride)
                    } label:
                    {
                        Text(ride.name)
                        Text(String(ride.waitTime))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
