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
    @State var score: Int = 0
    
    private func calculateScore() {
        score = 0
        if cardDetails.name == "" {
            score += 1
        }
        if cardDetails.number == "" {
            score += 1
        }
        if cardDetails.expiry == "" {
            score += 1
        }
        if cardDetails.cvv == "" {
            score += 1
        }
        //return score
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            CardView(cardDetails: cardDetails, isShowingFront: $isShowingFront, inputScore: score)
            
            Form {
                
                TextField("Card number", text: $cardDetails.number) { (editingChanged) in
                    calculateScore()
                }
                
                TextField("Name on the card", text: $cardDetails.name) { (editingChanged) in
                    calculateScore()
                }
                
                HStack {
                    
                    TextField("Expiry date", text: $cardDetails.expiry) { (editingChanged) in
                        calculateScore()
                    }
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
                            calculateScore()
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
