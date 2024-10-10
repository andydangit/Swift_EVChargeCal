//
//  ContentView.swift
//  EVChargeCal
//
//  Created by Andy Dang It on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var kWh = 0.00
    @State private var ECost = 0.11
    
    
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    
    //MARK: - VIEW
    var body: some View {
        NavigationStack{
            Form {
                Section("Total Energy Used:") {
                    TextField("kWh", value: $kWh, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                   
                }
                
                Section("Electricity Cost:"){
                    TextField("Enter the electricity cost", value: $ECost, formatter: currencyFormatter)
                }
                
                .navigationTitle("Energy usage calculator ")
            }
        }
        
    }
    
    //MARK: - Function
    
    func calculateTotalCost() -> Double {
        return kWh * ECost
    }
    
    //MARK: - END OF VIEW BODY
}

#Preview {
    ContentView()
}
