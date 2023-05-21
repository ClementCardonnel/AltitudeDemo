//
//  AltitudeData.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import Foundation
import CoreMotion

struct AltitudeData: Identifiable {
    let timestamp: TimeInterval
    let relativeAltitude: Double

    var id: TimeInterval {
        timestamp
    }

    var formattedTimestamp: String {
        let date = Date(timeIntervalSinceReferenceDate: timestamp)
        return date.formatted(date: .omitted, time: .standard)
    }

    var formattedAltitude: String {
        let measurement = Measurement(value: relativeAltitude, unit: UnitLength.meters)
        let style = Measurement<UnitLength>.FormatStyle(width: .abbreviated, usage: .general)
        return measurement.formatted(style)
    }

    init(_ altitudeData: CMAltitudeData) {
        self.timestamp = altitudeData.timestamp
        self.relativeAltitude = altitudeData.relativeAltitude.doubleValue
    }

}

struct AbsoluteAltitudeData: Identifiable {
    let timestamp: TimeInterval
    let altitude: Double
    let accuracy: Double
    let precision: Double

    var id: TimeInterval {
        timestamp
    }

    var formattedTimestamp: String {
        let date = Date(timeIntervalSinceReferenceDate: timestamp)
        return date.formatted(date: .omitted, time: .standard)
    }

    var formattedAltitude: String {
        let measurement = Measurement(value: altitude, unit: UnitLength.meters)
        let style = Measurement<UnitLength>.FormatStyle(width: .abbreviated, usage: .general)
        return measurement.formatted(style)
    }
    var formattedAccuracy: String {
        String("\(accuracy)".prefix(6))
    }
    var formattedPrecision: String {
        "\(precision)"
    }

    init(timestamp: TimeInterval, altitude: Double, accuracy: Double, precision: Double) {
        self.timestamp = timestamp
        self.altitude = altitude
        self.accuracy = accuracy
        self.precision = precision
    }

    init(_ altitudeData: CMAbsoluteAltitudeData) {
        self.timestamp = altitudeData.timestamp
        self.altitude = altitudeData.altitude
        self.accuracy = altitudeData.accuracy
        self.precision = altitudeData.precision
    }

}
