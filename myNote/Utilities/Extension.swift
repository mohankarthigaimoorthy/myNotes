//
//  Extension.swift
//  myNote
//
//  Created by Mohan K on 22/03/23.
//

import Foundation
import UIKit

extension Date {
    static func isToday(day: Int) -> Bool {
        return Calendar.current.dateComponents([.day], from: .now).day == day
    }
    
    static func isThisYear(year: Int) -> Bool {
        return Calendar.current.dateComponents([.year], from: .now).year == year
    }
}

extension Date {
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

