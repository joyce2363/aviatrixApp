//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    let data = AviatrixData()
    var author = ""
    var currentLocation = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000 //gallons
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4 // mpg
    var fuelCost = 0.0 // $
    init(userName : String) {
        author = userName
    }
    
    var running = false
    
    func start() -> Bool {
        running = true
        return running
    }
    
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        fuelLevel = 5000.0
        return gallonsNeeded
    }
    
    func flyTo(destination : String) {
        
        distanceTraveled += distanceTo(target: destination, currentLocation: currentLocation)
        currentLocation = destination
        
        // create a fuel spent variable that calculates how much fuel you have used...
        var fuelSpent = Double(distanceTraveled) / milesPerGallon
        
        //update fuelLevel based on fuelSpent
        fuelLevel -= fuelSpent
    }
    
    
    func distanceTo(target : String, currentLocation : String) -> Int {
        return data.knownDistances[currentLocation]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
    

}

















