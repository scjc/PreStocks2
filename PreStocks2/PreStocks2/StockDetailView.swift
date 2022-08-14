//
//  StockDetailView.swift
//  PreStocks2
//
//  Created by Jeremy Chang on 14/08/2022.
//

import SwiftUI

struct StockDetailView: View {
    
    // State variables
    @State private var GraphSelection = 0
    @State private var FavouriteStock = 1
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("IBM")
                Spacer()
                Text("United States")
                Spacer()
                Button(action: {
                    print("stock.ticker favourited")
                }) {
                    if (FavouriteStock == 1) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "heart")
                    }
                }
            }
            
            Text("Technology")
            
            HStack(alignment: .center) {
//                Text("\(String(format: "%.2f", stock.currentPrice))")
//                    .font(.system(size: 30))
//                    .fontWeight(.bold)
                Text("134.01")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Text("USD")
            }

            Text ("21.4 (1.32%)")
            
//            Text("\(stock.lastUpdateAsString())")
            
            Picker(selection: $GraphSelection, label: Text("Graph Type")) {
                Text("Line Graph").tag(0)
                Text("Candle Stick Graph").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            

            
            Spacer()
        } .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
        
        .navigationBarTitle(Text("IBM"), displayMode: .inline)    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView()
    }
}
