//
//  RelativeAltitudeList.swift
//  AltitudeDemo
//
//  Created by Clément Cardonnel on 21/05/2023.
//

import SwiftUI

struct RelativeAltitudeList: View {
    let altitudes: [AltitudeData]

    var body: some View {
        List {
            Section {
                ForEach(altitudes.reversed()) { altitude in
                    HStack {
                        Text(altitude.formattedTimestamp)
                        Spacer()
                        Text(altitude.formattedAltitude)
                    }
                }
            } header: {
                HStack {
                    Text("Time")
                    Spacer()
                    Text("Altitude")
                }
                .font(.subheadline)
            }
        }
    }

}

struct RelativeAltitudeList_Previews: PreviewProvider {
    static var previews: some View {
        RelativeAltitudeList(altitudes: [])
    }
}
