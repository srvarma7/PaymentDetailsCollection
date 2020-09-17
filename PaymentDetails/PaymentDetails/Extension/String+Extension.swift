//
//  String+Extension.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 18/9/20.
//

extension String {
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
       let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
       return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
       }.joined().dropFirst())
    }
}
