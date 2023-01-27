//
//  WeatherButton.swift
//  Weather_App
//
//  Created by Shreya Prasad on 16/11/22.
//

import SwiftUI
struct WeatherButton: View{
    var title : String
    var backColor : Color
    var foreColor : Color
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backColor)
            .foregroundColor(foreColor)
            .cornerRadius(10)
        
    }
}
