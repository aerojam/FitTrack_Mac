//
//  ContentView.swift
//  FitTrack
//
//  Created by Martin on 01.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataModel = MeasurementsModel()
    @State private var selectedMeasurement: Measurement?
    @State private var isShowingAddMeasurement = false
    
    private var mediumDateFormatter: DateFormatter {
        let mediumDateFormatter = DateFormatter()
        mediumDateFormatter.dateStyle = .long
        mediumDateFormatter.timeStyle = .none
        return mediumDateFormatter
    }
    
    var body: some View {
        NavigationSplitView {
            List(dataModel.measurements.sorted(by: >), selection: $selectedMeasurement) { measurement in
                NavigationLink("\(mediumDateFormatter.string(from: measurement.date))", value: measurement)
            }
            .listStyle(.sidebar)
        } detail: {
            VStack {
                if let measurement = selectedMeasurement {
                    MeasurementView(measurement: measurement).id(selectedMeasurement)
                } else {
                    if !dataModel.measurements.isEmpty {
                        Label("Select a measurement", systemImage: "filemenu.and.cursorarrow")
                            .foregroundColor(.secondary)
                    } else {
                        Label("No measurements", systemImage: "archivebox")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAddMeasurement) {
            AddMeasurementView()
                .environmentObject(dataModel)
        }
        .toolbar {
            ToolbarItemGroup {
                Button() {
                    isShowingAddMeasurement = true
                } label: {
                    Label("New measurement", systemImage: "plus")
                    
                }
                .help("New measurement")
                
                Button() {
                    dataModel.removeMeasurement(selectedMeasurement)
                    selectedMeasurement = nil
                } label: {
                    Label("Remove measurement", systemImage: "trash")
                }
                .help("Remove measurement")
                .disabled(selectedMeasurement == nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
