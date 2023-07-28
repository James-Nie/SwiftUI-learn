//
//  MapView.swift
//  AI
//
//  Created by niejianbo on 2023/6/26.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State var region = MKCoordinateRegion(
        center: .init(
            latitude: 37.334722,
            longitude: -122.008889),
        latitudinalMeters: 300,
        longitudinalMeters: 300
    )
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: [],
            showsUserLocation: true,
            userTrackingMode: nil,
            annotationItems: [PinItem(coordinate: .init(latitude: 37.334722, longitude: -122.008889))]) { item in
            MapMarker(coordinate: item.coordinate)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
