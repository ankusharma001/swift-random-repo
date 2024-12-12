//
//  Helper.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import Foundation

// Structure to represent time slots
struct TimeSlot {
    var startTime: String
    var endTime: String
}

// Structure to represent data of a servant
struct Servant {
    var id : Int
    var name: String
    var gender: String
    var image: String
    var experience: Int
    var rating: Double
    var numberOfReviews: Int
    var freeTimeSlots: [TimeSlot]
}


let firstServant = Servant(
    id: 1,
    name: "Rajni", gender: "Female",
    image: "rajni.jpg",
    experience: 5,
    rating: 4.5,
    numberOfReviews: 20,
    freeTimeSlots: [
        TimeSlot(startTime: "09:00", endTime: "11:00"),
        TimeSlot(startTime: "11:00", endTime: "12:30"),
        TimeSlot(startTime: "18:15", endTime: "20:30")
    ]
)

let secondServant = Servant(
    id: 2,
    name: "Mandeep", gender: "Female",
    image: "shabham.jpg",
    experience: 3,
    rating: 4.0,
    numberOfReviews: 15,
    freeTimeSlots: [
        TimeSlot(startTime: "09:00", endTime: "10:30"),
        TimeSlot(startTime: "14:00", endTime: "16:30"),
        TimeSlot(startTime: "18:00", endTime: "19:30")
    ]
)

let thirdServant = Servant(
    id: 3,
    name: "Ankush", gender: "Male",
    image: "rajni1.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    freeTimeSlots: [
        TimeSlot(startTime: "08:00", endTime: "11:00"),
        TimeSlot(startTime: "13:00", endTime: "15:30")
    ]
)
let fourthServant = Servant(
    id: 4,
    name: "Ramu", gender: "Male",
    image: "rajni.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    freeTimeSlots: [
        TimeSlot(startTime: "09:00", endTime: "11:00"),
        TimeSlot(startTime: "13:00", endTime: "15:30")
    ]
)
let fifthServant = Servant(
    id: 5,
    name: "Shabham", gender: "Female",
    image: "rajni1.jpg",
    experience: 12,
    rating: 4,
    numberOfReviews: 5,
    freeTimeSlots: [
        TimeSlot(startTime: "09:00", endTime: "12:00"),
        TimeSlot(startTime: "16:00", endTime: "17:00")
    ]
)

class ServantDataModel {
    private var servants: [Servant] = []
    static let shared = ServantDataModel()
    private init() {
        servants.append(firstServant)
        servants.append(secondServant)
        servants.append(thirdServant)
        servants.append(fourthServant)
        servants.append(fifthServant)
    }

    // Method to get all servants
    func getAllServants() -> [Servant] {
        return self.servants
    }
    
    // Method to find a servant by ID
    func getServant(by id: Int) -> Servant? {
        return servants.first { $0.id == id }
        
    }
    
    func findAvailableServants(startTimeAvailable: String, endTimeAvailable: String) -> [Servant] {
        servants.filter {
            $0.freeTimeSlots.filter {
                $0.startTime <= startTimeAvailable && $0.endTime >= endTimeAvailable
            }.count > 0
        }
    }
}
