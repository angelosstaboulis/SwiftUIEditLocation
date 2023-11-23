//
//  ContentView.swift
//  SwiftUIEditLocation
//
//  Created by Angelos Staboulis on 23/11/23.
//

import SwiftUI
import MapKit
import CoreLocation
struct ContentView: View {
    @State var coordinates:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    @State var place:String
    var body: some View {
        NavigationStack {
            Map{
                Marker(coordinate: coordinates) {
                    Text("Location in Map")
                }
            }.searchable(text: $place)
            .onSubmit(of: .search) {
                    CLGeocoder().geocodeAddressString(place) { placemarks, error in
                        let latitude = placemarks!.first!.location?.coordinate.latitude
                        let longitude = placemarks!.first!.location?.coordinate.longitude
                        coordinates = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                    }
            }.navigationTitle("SwiftUIEditLocation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView(place: "")
}
