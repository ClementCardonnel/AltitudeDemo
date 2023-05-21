//
//  PlaybackButton.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import SwiftUI

struct PlaybackButton: View {

    @ObservedObject var motionController: MotionController

    var body: some View {
        if motionController.isPaused {
            Button {
                motionController.start()
            } label: {
                Label {
                    Text("Start")
                } icon: {
                    Image(systemName: "play")
                }
                .labelStyle(.titleAndIcon)
            }
        } else {
            Button {
                motionController.pause()
            } label: {
                Label {
                    Text("Pause")
                } icon: {
                    Image(systemName: "pause")
                }
                .labelStyle(.titleAndIcon)
            }
        }
    }
    
}

struct PlaybackButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackButton(motionController: MotionController())
    }
}
