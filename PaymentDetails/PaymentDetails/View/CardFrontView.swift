//
//  CardFrontView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 16/9/20.
//

import SwiftUI

struct CardFrontView: View {
    
    @Binding var card: CardModel
    let statusImage: String
    
    let empty = "icloud"
    let start = "star"
    let startHalf = "star.lefthalf.fill"
    let startFill = "star.fill"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: statusImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 30)
                
                Spacer()
                
                Text("VISA")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text(card.number == "" ? "Enter card number" : card.number)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Card Holder Name")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(card.name == "" ? "Enter name on card" : card.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Expiry")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(card.expiry == "" ? "Enter expiry date" : card.expiry)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            }
        }
        .padding()
        .frame(width: 400, height: 260, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
    }
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        //let card = CardModel(number: "", name: "", expiry: "", cvv: "")
        let card = CardModel(number: "**** **** **** 1234", name: "Raghu", expiry: "20/20", cvv: "123")
        CardFrontView(card: .constant(card), statusImage: "icloud")
    }
}
