//
//  ContentView.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {

    @StateObject private var motionController = MotionController()

    var body: some View {
        TabView {
            NavigationStack {
                AbsoluteAltitudeList(altitudes: motionController.absoluteAltitudes)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            PlaybackButton(motionController: motionController)
                        }
                    }
            }
            .tabItem {
                Label {
                    Text("Absolute")
                } icon: {
                    Image(systemName: "equal.circle")
                }
            }

            NavigationStack {
                RelativeAltitudeList(altitudes: motionController.relativeAltitudes)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            PlaybackButton(motionController: motionController)
                        }
                    }
            }
            .tabItem {
                Label {
                    Text("Relative")
                } icon: {
                    Image(systemName: "chart.xyaxis.line")
                }
            }
        }
        .task {
            motionController.start()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
