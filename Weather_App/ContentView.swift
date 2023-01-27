//
//  ContentView.swift
//  Weather_App
//
//  Created by Shreya Prasad on 15/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackView(isNight: $isNight)
            VStack{
                CityView(cityName: "RANCHI, JHARKHAND")
                WeatherView(imageName:  isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                .padding(.bottom,40 )
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", temperature: 62, imageName: "snow")
                    WeatherDayView(dayOfWeek: "WED", temperature: 80, imageName: "cloud.rain.fill")
                    WeatherDayView(dayOfWeek: "THUR", temperature: 74, imageName:"cloud.sun.fill")
                    WeatherDayView(dayOfWeek:" FRI" , temperature: 67, imageName: "cloud.fog.fill")
                    WeatherDayView(dayOfWeek: "SAT", temperature: 75, imageName: "cloud.drizzle.fill")
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time ", backColor: .white, foreColor: .blue)
                    
                }
                Spacer()
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var temperature : Int
    var imageName: String
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode:.fit)
                .frame(width:40,height: 140)
            Text(" \(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackView: View {
  @Binding  var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherView: View {
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode:.fit)
                .frame(width:180,height: 180)
            Text(" \(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

