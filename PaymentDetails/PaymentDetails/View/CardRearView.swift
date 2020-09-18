//
//  CardRearView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 16/9/20.
//

import SwiftUI

struct CardRearView: View {
    
    var name: String
    var cvv: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
            }
            .frame(width: 400, height: 35)
            .background(Color.black)
            .padding([.top, .bottom], 15)
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Signature")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding([.leading], 10)
                        .padding([.bottom], 0.2)
                    
                    Text(name == "" ? "Enter name" : name)
                        .font(.custom("Noteworthy-Light", size: 20))
                        .fontWeight(.bold)
                        .frame(width: 200, height: 40, alignment: .leading)
                        .padding(.leading, 5)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    
                }
                
                VStack(alignment: .trailing) {
                    
                    Text("CVV")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding([.bottom], 0.2)
                    
                    Text(cvv == "" ? "---" : cvv)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.trailing, 10)
                        .frame(width: 50, height: 40, alignment: .trailing)
                        .background(Color.gray)
                        .foregroundColor(.white)
                    
                }.offset(x: -10)
                
                
            }.padding()
            
            Spacer()
        }
        .padding()
        .frame(width: 400, height: 260, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
    
    }
}

struct CardRearView_Previews: PreviewProvider {
    static var previews: some View {
        CardRearView(name: "", cvv: "")
    }
}
