//
//  ContentView.swift
//  ValuePerPerson
//
//  Created by Abhijeet Aher on 12/26/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var tipPercentageValue = [10,15,20,30,0]

    private var perPesrsonCount : Double {
        
        let totalPeople = Double (numberOfPeople + 2)
        let totalAmount = Double (checkAmount) ?? 0
        let totalTipPercentage = Double (tipPercentageValue[tipPercentage])

        let tipOfAmount = totalAmount / 100 * totalTipPercentage
        let tipWithAmount = tipOfAmount + totalAmount
        let perPersonShare = tipWithAmount / totalPeople
        return perPersonShare
    }

    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Enter the amount: ", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                    Picker( selection: $numberOfPeople, label: Text("Number of people:" )) {
                    ForEach(2..<100){
                        Text("\($0) people").id($0)
                    }
                }
            }
            
            Section(header: Text("Tip percentage")){
                Picker(selection:$tipPercentage , label: Text("Tip Percentage: "))
                    {
                        ForEach(0 ..< tipPercentageValue.count){
                            Text("\(self.tipPercentageValue[$0]) %")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Text("$\(perPesrsonCount, specifier: "%.2f" )")
                    }
            }.navigationBarTitle("Per Person")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
