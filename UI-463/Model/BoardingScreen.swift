//
//  BoardingScreen.swift
//  UI-463
//
//  Created by nyannyan0328 on 2022/02/14.
//

import SwiftUI

struct BoardingScreen: Identifiable {
   
    var id = UUID().uuidString
    var image : String
    var title : String
    var decription : String
}

let title = "Easy Payments with \nWallestroy"
let desc = "Small business can recive device \npayment super fast and super easy"

var boadingScreens : [BoardingScreen] = [


BoardingScreen(image: "screen1", title: title, decription: desc),
BoardingScreen(image: "screen2", title: title, decription: desc),
BoardingScreen(image: "screen3", title: title, decription: desc),
BoardingScreen(image: "screen4", title: title, decription: desc),


]

