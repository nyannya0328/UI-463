//
//  Splash.swift
//  UI-463
//
//  Created by nyannyan0328 on 2022/02/14.
//

import SwiftUI

struct Splash: View {
    @State var animation : [Bool] = Array(repeating: false, count: 3)
    var body: some View {
        ZStack{
            
            
            OnBoarding()
            
            
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
