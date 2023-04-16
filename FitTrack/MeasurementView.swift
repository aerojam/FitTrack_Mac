//
//  MeasurementView.swift
//  FitTrack
//
//  Created by Martin on 02.04.2023.
//

import SwiftUI

struct MeasurementView: View {
    @State var measurement: Measurement
    
    var body: some View {
        VStack {
            Group {
                Text("\(measurement.date)")
                Text("Weight:")
                Text("\(measurement.weight)")
                Text("BMI:")
                Text("\(measurement.bmi)")
                Text("Tělesný tuk:")
                Text("\(measurement.bodyFat)")
                Text("Svaly:")
                Text("\(measurement.muscles)")
                Text("Viscerální tuk:")
            }
            Group {
                Text("\(measurement.visceral)")
                Text("Klidový metabolismus:")
                Text("\(measurement.restingMetabolism)")
                Text("Poznámka:")
                Text(measurement.notes)
            }
            
        }
    }
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView(measurement: Measurement.example)
    }
}
