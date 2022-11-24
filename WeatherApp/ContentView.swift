//
//  ContentView.swift
//  WeatherApp
//
//  Created by Diego Flores Domenech on 12/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    let daysData: [DaySummaryViewData] = [
        DaySummaryViewData(day: "TUE", imageName: "cloud.sun", minTemperature: "10º", maxTemperature: "25º"),
        DaySummaryViewData(day: "WED", imageName: "sun.max", minTemperature: "15º", maxTemperature: "27º"),
        DaySummaryViewData(day: "THU", imageName: "wind", minTemperature: "20º", maxTemperature: "30º"),
        DaySummaryViewData(day: "FRI", imageName: "sun.max", minTemperature: "12º", maxTemperature: "22º"),
        DaySummaryViewData(day: "SAT", imageName: "cloud.rain", minTemperature: "24º", maxTemperature: "28º"),
    ]
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Text("San Vicente")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                Spacer()
                TopHeaderView()
                ScrollView(.horizontal) {
                    HStack() {
                        ForEach(daysData) { dayData in
                            DaySummaryView(data: dayData)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        
    }
    
}

struct TopHeaderView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "cloud.sun")
                .resizable()
                .frame(width: 150, height: 100)
                .aspectRatio(contentMode: .fit)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
            Text("Max: 29º | Min: 18º")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .bold))
        }
    }
}

struct DaySummaryView: View {
    
    let data: DaySummaryViewData
    
    var body: some View {
        VStack(spacing: 5) {
            Text(data.day.uppercased())
                .foregroundColor(.white)
                .font(.system(size: 15))
            Image(systemName: data.imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit)
            Text("\(data.minTemperature)|\(data.maxTemperature)")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }.frame(width: 80, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DaySummaryViewData: Identifiable {
    var id: UUID = UUID()
    
    let day: String
    let imageName: String
    let minTemperature: String
    let maxTemperature: String
}
