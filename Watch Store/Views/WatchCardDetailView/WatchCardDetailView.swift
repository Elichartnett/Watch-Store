//
//  WatchCardDetailView.swift
//  Watch Store
//
//  Created by Eli Hartnett on 8/29/22.
//

import SwiftUI

struct WatchCardDetailView: View {
    
    @EnvironmentObject var storeModel: StoreModel
    @ObservedObject var watch: Watch
    @Binding var navigationPath: NavigationPath
    let cardOffset: CGFloat = 30
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                DetailViewImageView(watch: watch)
                    .accessibility(label: Text("Watch image"))
                    .accessibilityAddTraits(AccessibilityTraits.isImage)
                
                Text("\(Watch.getCaseTitle(caseType: watch.caseType)) With \(Watch.getBandTitle(bandType: watch.bandType))")
                    .font(.title)
                    .bold()
                    .accessibilityHeading(.h1)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("5.0 ").bold() + Text("(999 Reviews)")
                        .fontWeight(.light)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("999 reviews with an average of 5 stars.")
                
                Group {
                    Text(Watch.getCaseDescription(caseType: watch.caseType))
                        .fontWeight(.light)
                    
                    Text(Watch.getBandDescription(bandType: watch.bandType))
                        .fontWeight(.light)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Description")
                
                Group {
                    Text("Band Colors")
                        .font(.title2)
                        .bold()
                    
                    Divider()
                    
                    WatchBandOptionsView(watch: watch, size: CGSize(width: 32, height: 32))
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Band color options"))
                .accessibilityHeading(.h2)
                
                Group {
                    Text("Case Sizes")
                        .font(.title2)
                        .bold()
                    
                    Divider()
                    
                    DetailViewCaseSizeView(watch: watch, size: .regular)
                    
                    DetailViewCaseSizeView(watch: watch, size: .large)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Case size options"))
                .accessibilityHeading(.h2)
                
                Group {
                    Text("Connectivity")
                        .font(.title2)
                        .bold()
                    
                    Divider()
                    
                    HStack {
                        DetailViewConnectivityView(watch: watch, connectivity: .gps)
                        
                        DetailViewConnectivityView(watch: watch, connectivity: .gpsAndCellular)
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Connectivity options"))
                .accessibilityHeading(.h2)
                
                AddToCartView(watch: watch)
                    .padding()
                
                DetailViewAppleCareView()
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Apple care description"))
                    .accessibilityHeading(.h2)
            }
            .padding(.horizontal)
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                CartToolBarItem()
            }
            
            ToolbarItem(placement: .primaryAction) {
                Image(systemName: "x.circle.fill")
                    .onTapGesture {
                        navigationPath.removeLast()
                    }
            }
        }
    }
}

struct WatchCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WatchCardDetailView(watch: dev.watch, navigationPath: .constant(NavigationPath()))
                .environmentObject(StoreModel())
        }
    }
}
