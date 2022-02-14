//
//  offsetPageTabView.swift
//  UI-463
//
//  Created by nyannyan0328 on 2022/02/14.
//

import SwiftUI

struct offsetPageTabView<Content : View>: UIViewRepresentable {
   
    var content : Content
    @Binding var offset : CGFloat
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        self.content = content()
        self._offset = offset
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let scroll = UIScrollView()
        let hoting = UIHostingController(rootView: content)
        hoting.view.backgroundColor = .clear
        hoting.view.translatesAutoresizingMaskIntoConstraints = false
        let contains = [
        
            hoting.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hoting.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hoting.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hoting.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hoting.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
        
        ]
        
        scroll.addConstraints(contains)
        scroll.addSubview(hoting.view)
        
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.delegate = context.coordinator
        
        
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
        let currentOffset = uiView.contentOffset.x
        
        if offset != currentOffset{
            
            
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
        
        
        
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : offsetPageTabView
        
        init(parent : offsetPageTabView) {
            self.parent = parent
        }
        
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
            
        }
    }
 
    
    
 
}

