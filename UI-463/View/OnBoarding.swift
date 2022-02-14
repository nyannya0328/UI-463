//
//  OnBoarding.swift
//  UI-463
//
//  Created by nyannyan0328 on 2022/02/14.
//

import SwiftUI

struct OnBoarding: View {
    @State var offset : CGFloat = 0
    var body: some View {
        offsetPageTabView(offset: $offset) {
            
            
            
            
            HStack(spacing:0){
                
                
                ForEach(boadingScreens){screen in
                    
                    
                    VStack(spacing:20){
                        
                        
                        
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                            .offset(y: -100)
                        
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            
                            Text(screen.title)
                                .font(.largeTitle.weight(.bold))
                                .lineSpacing(12)
                            
                            
                            Text(screen.decription)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            
                            
                        }
                        .lLeading()
                        .offset(y: -70)
                    }
                    
                    
                    
                }
                .padding()
                .frame(width: getScreenBounds().width)
                
            }
          
            
        }
        .background(
        
        
        
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees: getRotation()))
                .offset(y: -getScreenBounds().width + 20)
            
                
        
        
        )
        .background(Color("screen\(getIndex() + 1)"))
        .overlay(alignment: .bottom) {
            
            
            VStack{
                
                
                HStack(spacing:10){
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With A")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal,30)
                            .background(.white,in:RoundedRectangle(cornerRadius: 10))
                            .lcenter()
                        
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With B")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal,30)
                            .background(.white,in:RoundedRectangle(cornerRadius: 10))
                            .lcenter()
                        
                    }


                    
                    
                }
                .padding()
                
                HStack(spacing:10){
                    
                    
                    Button {
                        
                        
                        offset = max(offset - getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        
                        Text("Back")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                    
                    HStack(spacing:15){
                        
                        
                        ForEach(boadingScreens.indices,id:\.self){index in
                            
                            
                            Circle()
                                .fill(getIndex() == index ? .red.opacity(0.3) : .white)
                                .frame(width: 9,height: 9)
                                .scaleEffect( getIndex() == index ? 2 : 1)
                                .animation(.spring(), value: getIndex())
                            
                          
                        }
                        
                        
                    }
                    .lcenter()
                    .offset(x: 20)

                    
                    Button {
                        
                        
                        offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    } label: {
                        
                        Text("Next Stage")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                        
                }
            }
            .padding(.top,30)
            .padding(.horizontal,8)
            
            
        }
        .padding(.bottom,getSafeArea().bottom)
    }
    
    func getIndex()->Int{
        
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
    
    func getRotation() -> Double{
        
        
        let progress = offset / (getScreenBounds().width * 4)
        let rotation = Double(progress) * 360
        return rotation
        
        
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
