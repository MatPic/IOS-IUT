//
//  API.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation

class Api {
    
    public func getStopPoint(longitude : Double, latitude : Double, completion: @escaping ([Stop]?) -> Void) {

        let url = URL(string: "https://data.metromobilite.fr/api/linesNear/json?x=\(longitude)&y=\(latitude)&dist=800&details=true")
                
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let stopsResult = try jsonDecoder.decode([Stop].self, from: dataResult)
                        completion(stopsResult)
                        
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
        
    }
    
    public func getTimeTable(stopId: String, completion: @escaping ([LineTime]?) -> Void) {
		let url = URL(string: "https://data.metromobilite.fr/api/routers/default/index/stops/\(stopId)/stoptimes")
        
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let timesResults = try jsonDecoder.decode([LineTime].self, from: dataResult)
                        completion(timesResults)
                        
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
		// TODO: Récupération des heures de passage pour un stopId donné
    }
    
    public func getAllLinesData(completion: @escaping ([Line]?) -> Void) {
        let url = URL(string: "https://data.metromobilite.fr/api/routers/default/index/routes")
        
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let linesResults = try jsonDecoder.decode([Line].self, from: dataResult)
                        completion(linesResults)
                        
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
        // TODO: Récupération des heures de passage pour un stopId donné
    }
}
