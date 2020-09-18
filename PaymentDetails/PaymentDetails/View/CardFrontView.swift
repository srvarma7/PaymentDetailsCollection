//
//  CardFrontView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 16/9/20.
//

import SwiftUI

struct CardFrontView: View {
    
    var card: CardModel
    var inputScore: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: imageName())
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(imageColor())
                    .frame(width: 20)
                
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
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(card.name == "" ? "Enter name" : card.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Expiry")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(card.expiry == "" ? "Expiry date" : card.expiry)
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
    
    private func imageName() -> String {
        switch inputScore {
            case 0  : return "checkmark.seal.fill"
            case 1  : return "checkmark.seal"
            case 2  : return "doc.text.fill"
            case 3  : return "doc.text"
            case 4  : return "pencil.tip"
            default : return "heart.fill"
        }
    }
    
    private func imageColor() -> Color {
        switch inputScore {
            case 4  : return Color.white
            case 3  : return Color.orange
            case 2  : return Color.yellow
            case 1  : return Color.orange
            case 0  : return Color.green
            default : return Color.red
        }
    }
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView(card: CardModel(), inputScore: 0)
    }
}
