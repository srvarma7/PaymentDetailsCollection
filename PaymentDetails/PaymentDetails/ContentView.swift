//
//  ContentView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 16/9/20.
//

import SwiftUI
import Combine

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
    }
    
    var body: some View {
        
        VStack {
            
            CardView(cardDetails: cardDetails, isShowingFront: $isShowingFront, inputScore: score)
                .padding(.top, 50)
                .onAppear(perform: {
                    calculateScore()
                })
            
            Form {
                
                TextField("Card number", text: $cardDetails.number) { (onChanged) in
                    calculateScore()
                }.keyboardType(.numberPad)
                .onReceive(Just(self.cardDetails.number)) { inputValue in
                    
                    cardDetails.number = cardDetails.number.grouping(every: 4, with: "-")
                    
                    // With a little help from https://bit.ly/2W1Ljzp
                    if inputValue.count > 20 {
                        self.cardDetails.number.removeLast()
                    }
                }
                
                TextField("Name on the card", text: $cardDetails.name) { (editingChanged) in
                    calculateScore()
                }.keyboardType(.alphabet)
                .autocapitalization(.allCharacters)
                
                HStack {
                    
                    TextField("Expiry date", text: $cardDetails.expiry) { (editingChanged) in
                        calculateScore()
                    }.keyboardType(.numberPad)
                    .frame(width: 220)
                    .onReceive(Just(self.cardDetails.expiry)) { inputValue in
                        cardDetails.expiry = cardDetails.expiry.grouping(every: 2, with: "/")
                        // With a little help from https://bit.ly/2W1Ljzp
                        if inputValue.count > 5 {
                            self.cardDetails.expiry.removeLast()
                        }
                    }
                    
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
                    .keyboardType(.numberPad)
                    .onReceive(Just(self.cardDetails.cvv)) { inputValue in
                        // With a little help from https://bit.ly/2W1Ljzp
                        if inputValue.count > 3 {
                            self.cardDetails.cvv.removeLast()
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: 200)
            .onTapGesture {
                calculateScore()
            }
            
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
