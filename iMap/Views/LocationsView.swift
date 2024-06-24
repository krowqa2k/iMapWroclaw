//
//  LocationsView.swift
//  iMap
//
//  Created by admin on 24/06/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var ViewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $ViewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                    
                
                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: { ViewModel.toggleLocationsList() }, label: {
                Text(ViewModel.mapLocation.name + ", " + ViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: ViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.up" )
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: ViewModel.showLocationsList ? 180 : 0))
                    }
            })
            if ViewModel.showLocationsList {
                    LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
}
