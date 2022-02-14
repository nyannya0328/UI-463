//
//  ContentView.swift
//  UI-463
//
//  Created by nyannyan0328 on 2022/02/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        
        SplashScrren()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScrren : View{
    
    @State var animation : [Bool] = Array(repeating: false, count: 2)
    
    var body: some View{
        
        ZStack{
            
            OnBoarding()
                .opacity(animation[1] ? 1 : 0)
            
            if !animation[1]{
                
                
                Color("BG")
                    .mask {
                        
                        Rectangle()
                            .overlay {
                                
                                Image("p1")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 80, height: 80)
                                    .scaleEffect(animation[0] ? 40 : 1)
                                    .blendMode(.destinationOut)
                                
                                
                            }
                            
                        
                    }
                
         
                
            }
            
            
        }
        .ignoresSafeArea()
        .onAppear {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                withAnimation(.easeInOut(duration: 0.6).speed(0.7)){
                    
                    animation[0] = true
                }
                
                withAnimation(.easeInOut(duration: 1.5)){
                    
                    animation[1] = true
                }
                
                
                
            }
        }
        
    }
    
    
    
}

extension View{
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
    func lLeading()->some View{
         
         self
             .frame(maxWidth:.infinity,alignment: .leading)
     }
     func lTreading()->some View{
         
         self
             .frame(maxWidth:.infinity,alignment: .trailing)
     }
     func lcenter()->some View{
         
         self
             .frame(maxWidth:.infinity,alignment: .center)
     }
     
     func maxHW()->some View{
         
         self
             .frame(maxWidth:.infinity,maxHeight: .infinity)
         
     
     }
    
    func getSafeArea()->UIEdgeInsets{
        
        
        guard let scrren = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
        }
        
        guard let safeArea = scrren.windows.first?.safeAreaInsets else {
            
            return .zero
        }
        
        return safeArea
    }

    
    
}
