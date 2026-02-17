//
//  String + formatId.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

extension Int {
    func formatId() -> String {
        switch self {
        case 1..<10:
            return "#00\(self)"
        case 10..<100:
            return "#0\(self)"
        default:
            return "#\(self)"
        }
    }
    
    func formatWeight() -> String {
        let weightInKgs = Float(self) / 10
        let weightInKgsFormatted = String(format: "%.1f", weightInKgs)
        return "\(weightInKgsFormatted) kg"
    }
    
    func formatHeight() -> String {
        let heightInMeters = Float(self) / 10
        let heightInMetersFormatted = String(format: "%.1f", heightInMeters)
        return "\(heightInMetersFormatted) m"
    }
    
    func formatBaseStats() -> String {
        switch self {
        case 0..<10:
            return "00\(self)"
        case 10..<100:
            return  "0\(self)"
        default:
            return  "\(self)"
        }
    }
}
