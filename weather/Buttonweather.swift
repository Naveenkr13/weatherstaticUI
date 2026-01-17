//
//  Buttonweather.swift
//  weather
//
//  Created by Naveen Kumar on 18/01/26.
//

import Foundation
import SwiftUI
struct ButtonWeather:View{
    var btntxt:String
    var textcolor:Color
    var backgroundcolor:Color
    
    var body:some View{
            Text(btntxt)
                .frame(width: 210,height: 50)
                .background(backgroundcolor)
                .foregroundColor(textcolor)
                .font(.system(size: 19,weight: .bold,design: .default))
                .cornerRadius(10)
        }
        
    }
