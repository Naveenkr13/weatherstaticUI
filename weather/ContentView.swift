//
//  ContentView.swift
//  weather
//
//  Created by Naveen Kumar on 17/01/26.
//

import SwiftUI

struct ContentView: View {
   
    // struct har bar create and destrou hota hai but
    // state create hokar rukta hai aaram se kahi nahi jata hai
    @State private var isNight=false
   


    
    var body: some View {
        ZStack {
           
            // use $ dollar sign here to bind
            
            BackgroundView(isNight: $isNight)
            
            // v stack for vertically
            VStack {
                
                // dynamic city name has enter
                CityTextView(cityName:"BIHAR")
        
                // for dynamic main weather show  use struct and define method
                // isNight ? True:False statement print
                Mainweathershow(imgaName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",temp: 24)
                
        
                    .padding(.bottom,80)
                
                
                // Hstack for days
                HStack(spacing:10){
                    // day 1
                    Dayweather(days: "TUE",
                               imageNmae: "cloud.sun.fill",
                               temprature: 24)
                    // day 2
                    Dayweather(days: "WED",
                               imageNmae: "cloud.fill",
                               temprature: 21)
                    //day3
                    Dayweather(days: "THU",
                               imageNmae: "cloud.sun.rain.fill",
                               temprature: 19)
                    //day4
                    Dayweather(days: "FRI",
                               imageNmae: "cloud.rainbow.crop.fill",
                               temprature: 22)
                    //day5
                    Dayweather(days: "SAT",
                               imageNmae: "wind.snow",
                               temprature: 15)
                }
                
                Spacer()
             
                
                //Buttton for custom day night
                Button{
                    isNight.toggle()
                }label: {
                    ButtonWeather(btntxt:"Day Change",
                                  textcolor: .blue,
                                  backgroundcolor: .white)
                }
                
                
                Spacer()
                
            }
        }
    }
}
          //////////////////////////
#Preview {
    ContentView()
}
//////////// Structure METHOD CREATE FOR ALL STUF ON AVOBE////////////////////////////////

///
// for all day we create a single code to use for all week in day
struct Dayweather:View{
    // custome name for several days in week and images
    var days:String
    var imageNmae:String
    var temprature:Int
    var body:some View{
        // for day
        
        VStack{
            Text(days).foregroundStyle(.white)
                .font(Font.system(size: 30,weight: .medium,design: .default))
            VStack{
                Image(systemName: imageNmae)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode:.fit)
                    .frame(width:40,height: 40)
                Text("\(temprature)°C")
                    .foregroundStyle(.white)
                    .font(Font.system(size: 30))
            }
        }
    }
}

// design for background color

struct BackgroundView:View{
    
    // Binding use hota hai kisi bhi chiz ko ek jaise rakhne me aur ek dusre se bind karne me
    // state private isnight ka value ko ya bind karenge
    // use $ dollar sign to bind
    
//    
//    var topColor:Color
//    var bottomColor:Color
//
    @Binding var isNight:Bool
    
    var body:some View{
        LinearGradient(gradient: Gradient(colors:[isNight ? .black :.blue, isNight ? .gray : Color("lightBlue")])
                       ,startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        
    }
}
// city name show
struct CityTextView:View{
    var cityName:String
    var body:some View{
        Text(cityName)
            .font(.system(size: 35,weight: .medium,design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}
struct Mainweathershow:View {
    
    var imgaName:String
    var temp:Int
    var body:some View{
        VStack(spacing:10){
            Image(systemName: imgaName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°C")
                .font(Font.system(size: 45,weight: .medium,design: .default))
                .foregroundStyle(.white)
        }
        
        
        .padding(.bottom,80)
    }
}

// button i create one separte swiftui file to show the , that we can put the struct method in file and here i use that file



