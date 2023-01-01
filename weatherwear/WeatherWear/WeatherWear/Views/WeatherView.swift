//
//  WeatherView.swift
//  WeatherWear
//
//  Created by Bev McGhee on 12/30/22.
//

import SwiftUI
import SpriteKit

struct WeatherView: View {
    
    var weather: ResponseBody
    var body: some View {
        ZStack {
          
//            GeometryReader{_ in
//                SpriteView(scene: RainFall(), options: [.allowsTransparency])
//
//            }
        
            VStack {
                VStack(alignment: .center, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 60))
                            
                            Text(weather.weather[0].main)
                                .font(.system(size: 30))
                        }
                        .padding(.top, 27.0)
                        .frame(width: 124, alignment: .leading)
                        
//                        Spacer()
                        
                        Text(weather.main.temp.roundDouble( ) + "°").font(.system(size: 50)).fontWeight(.medium)
                        Text(weather.main.tempMin.roundDouble() + "°").font(.system(size: 30)).fontWeight(.light)
                        Text(weather.main.tempMax.roundDouble() + "°").font(.system(size: 30)).fontWeight(.light)
                        
                    }
//                    Spacer()
                        .frame(height: 80)
                    
                    VStack {
                        
                        Image("lightRainJacket")
                                .resizable()
                                .scaledToFit()
                        
                        }
                    }
                    
                    Spacer()
                
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
      
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
        
//        SpriteView(scene: RainFall(), options: [.allowsTransparency])
        }
    
    }


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
            .preferredColorScheme(.light)
            
    }
}

class RainFall: SKScene{
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.4, y: 8)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "rainFall.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

