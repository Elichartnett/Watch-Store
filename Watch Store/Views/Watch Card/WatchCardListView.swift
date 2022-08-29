//
//  WatchCardListView.swift
//  Watch Store
//
//  Created by Eli Hartnett on 8/28/22.
//

import SwiftUI

struct WatchCardListView: View {
    
    @State var watch: Watch
    let watchTopOffset: CGFloat = 20
    
    var body: some View {
        
        HStack {
            
            VStack (spacing: 23) {
                Image(watch.image)
                    .resizable()
                    .frame(width: 129, height: 214)
                
                WatchBandOptionsView(watch: watch)
            }
            .padding(.leading)
            .offset(y: -watchTopOffset)
            
            Spacer()
            
            VStack (alignment: .trailing) {
                
                FavoriteWatchView(watch: watch)
                
                WatchPriceView(price: watch.price)
                
                WatchTitleView(caseType: watch.caseType)
                
                WatchBandTitleView(bandType: watch.bandType)
                
                Spacer()
                
                AddToBagView(watch: watch)
            }
            .padding()
        }
        .frame(height: 239)
        .frame(maxWidth: .infinity)
        .background {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemGray6).opacity(0.5), Color(uiColor: .systemGray4)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
        }
        .padding(.top, watchTopOffset)
    }
}

struct WatchCardListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchCardListView(watch: dev.watch)
    }
}