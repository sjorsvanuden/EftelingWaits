//
//  QueueViewModel.swift
//  EftelingWaits Watch App
//
//  Created by sjorsvanuden on 13/08/2023.
//

import Foundation

class QueueViewModel: ObservableObject {
    @Published var rides: [Rides] = []
    let url: String = "https://queue-times.com/nl/parks/160/queue_times.json"

    var timer: Timer?
    init(){
        getQueues()
    }
    
    func getQueues(){
        rides = []
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //set http method as POST
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {

                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Welcome.self, from: data)
                    for land in parsedJSON.lands {
                        for ride in land.rides{
                            self.rides.append(Rides(name: ride.name, waitTime: ride.wait_time))
                        }
                    }
                }

                catch {
                    print(error)
                }
            }
            self.rides = self.rides.sorted { $0.name < $1.name}
        }
        task.resume()

    }
}
