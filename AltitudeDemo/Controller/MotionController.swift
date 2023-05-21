//
//  MotionController.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import Foundation
import CoreMotion

final class MotionController: ObservableObject {
    @Published var absoluteAltitudes = [AbsoluteAltitudeData]()
    @Published var relativeAltitudes = [AltitudeData]()
    @Published var isPaused = true

    let altimeter = CMAltimeter()

    func start() {
        isPaused = false
        startRecordingAltitude()
        startRecordingRelativeAltitude()
    }

    func pause() {
        isPaused = true
        altimeter.stopAbsoluteAltitudeUpdates()
        altimeter.stopRelativeAltitudeUpdates()
    }

    func startRecordingAltitude() {
        altimeter.startAbsoluteAltitudeUpdates(to: .main) { [weak self] data, error in
            if let error {
                print(error)
            }

            if let data {
                self?.absoluteAltitudes.append(AbsoluteAltitudeData(data))
            }
        }
    }

    func startRecordingRelativeAltitude() {
        altimeter.startRelativeAltitudeUpdates(to: .main) { [weak self] data, error in
            if let error {
                print(error)
            }

            if let data {
                self?.relativeAltitudes.append(AltitudeData(data))
            }
        }
    }
}
