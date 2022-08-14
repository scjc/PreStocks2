//
//  StockDetailView.swift
//  PreStocks2
//
//  Created by Jeremy Chang on 14/08/2022.
//

import SwiftUI
import Charts

struct StockMark: Identifiable {
    let ticker: String
    let date: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    
    var id: Date { date }
}

let prices: [StockMark] = [
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-12"), open: 132.6200, high: 134.0900, low: 131.9800, close: 134.0100),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-11"), open: 132.3600, high: 133.2250, low: 132.0000, close: 132.5400),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-10"), open: 130.7500, high: 131.7800, low: 130.3400, close: 131.5000),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-09"), open: 129.9200, high: 130.7900, low: 129.1200, close: 129.4700),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-08"), open: 133.1000, high: 133.3500, low: 132.0200, close: 132.6100),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-05"), open: 132.6200, high: 134.0900, low: 131.9800, close: 132.4800),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-04"), open: 132.3600, high: 133.2250, low: 132.0000, close: 131.6400),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-03"), open: 130.7500, high: 131.7800, low: 130.3400, close: 132.3400),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-02"), open: 129.9200, high: 130.7900, low: 129.1200, close: 131.8100),
    .init(ticker: "IBM", date: setStringDate(string: "2022-08-01"), open: 133.1000, high: 133.3500, low: 132.0200, close: 132.0400)
]

private func setStringDate (string: String) -> Date {
    let stringDate = string
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: stringDate)
    
    return dateFormatter.date(from: stringDate)!
}

struct StockDetailView: View {
    
    // State variables
    @State private var GraphSelection = 0
    @State private var FavouriteStock = 1
    
    var body: some View {
        VStack (alignment: .leading){
            VStack(alignment: .leading) {
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
                        .padding(.vertical, 1)
                    Text("USD")
                }

                Text ("21.4 (1.32%)")
            }.padding(.bottom)
            
//            Text("\(stock.lastUpdateAsString())")
            
            Picker(selection: $GraphSelection, label: Text("Graph Type")) {
                Text("Line Graph").tag(0)
                Text("Candle Stick Graph").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            
            Chart {
                ForEach(prices) { element in
                    LineMark(
                        x: .value("Date", element.date),
                        y: .value("Price", element.close)
                    ).symbol(by: .value("ticker", element.ticker))
                }
            }.frame(height: 250)
            

            
            Spacer()
        } .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
        
        .navigationBarTitle(Text("IBM"), displayMode: .inline)    }
    
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView()
    }
}
