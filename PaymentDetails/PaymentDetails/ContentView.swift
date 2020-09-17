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
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            CardView(cardDetails: cardDetails, isShowingFront: $isShowingFront)
            
            Form {
                TextField("Card number", text: $cardDetails.number)
                
                TextField("Name on the card", text: $cardDetails.name)
                
                HStack {
                    TextField("Expiry date", text: $cardDetails.expiry)
                        .frame(width: 220)
                    
                    Text("|")
                        .foregroundColor(.gray)
                        .opacity(0.6)
                    
                    TextField("CVV", text: $cardDetails.cvv) { (editingChanged) in
                        withAnimation(.interpolatingSpring(mass: 1,
                                                           stiffness: 100,
                                                           damping: 10,
                                                           initialVelocity: 0)) {
                            self.isShowingFront.toggle()
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: 200)
            
            Button("Proceed", action: {
                self.showAlert.toggle()
            }).alert(isPresented: $showAlert) {
                Alert(
                  title: Text("Are you sure?"),
                  message: Text("Do you want to proceed the payment?"),
                  primaryButton: .destructive(Text("Yes"), action: {
                  }),
                  secondaryButton: .cancel(Text("No"), action: {
                  })
                )
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10.0)
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardDetails: CardModel())
    }
}
