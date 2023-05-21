//
//  AbsoluteAltitudeList.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import SwiftUI

struct AbsoluteAltitudeList: View {

    let altitudes: [AbsoluteAltitudeData]

    var body: some View {
        List {
            Section {
                ForEach(altitudes.reversed()) { altitude in
                    HStack {
                        Text(altitude.formattedTimestamp)
                        Spacer()
                        Text(altitude.formattedAltitude)
                        Spacer()
                        Text(altitude.formattedAccuracy)
                        Spacer()
                        Text(altitude.formattedPrecision)
                    }
                }
            } header: {
                HStack {
                    Text("Time")
                    Spacer()
                    Text("Altitude")
                    Spacer()
                    Text("Accuracy")
                    Spacer()
                    Text("Precision")
                }
                .font(.subheadline)
            }
        }
    }
    
}

struct AbsoluteAltitudeList_Previews: PreviewProvider {
    static var previews: some View {
        AbsoluteAltitudeList(altitudes: [])
    }
}
