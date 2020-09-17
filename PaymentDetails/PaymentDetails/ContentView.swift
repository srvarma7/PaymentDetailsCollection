//
//  ContentView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 16/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardDetails: CardModel = CardModel()
    @State var isShowingFront = true
    
    var body: some View {
        
        CardView(cardDetails: cardDetails, isShowingFront: $isShowingFront)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardDetails: CardModel())
    }
}
