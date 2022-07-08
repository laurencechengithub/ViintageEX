//
//  StockView.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/6.
//

import SwiftUI

struct StockView: View {
    //    @EnvironmentObject private var viewModel:HomeViewModel//from @StateObject
        @StateObject private var viewModel = StockViewModel()
        @State private var isShowPortfolio: Bool = false
        
        init() {
    //        UITableView.appearance().backgroundColor = UIColor.lightGray
        }
        
        var body: some View {
            ZStack{
                Color.theme.bg.ignoresSafeArea()
                VStack {
                    homeHeader
                    titleBar
                    
                    if isShowPortfolio == false {
                        allQuoteList
                            .transition(.move(edge: .leading))
                    } else {
                        broughtQuoteList
                            .transition(.move(edge: .bottom))
                    }
                    Spacer(minLength: 0)
                }
                
            }
        }
        
}

extension StockView {
    
    private var homeHeader: some View {
        
        HStack{
            CircleBtnView(iconName: isShowPortfolio ? "plus" : "info" )
                .transaction { theTransaction in
                    theTransaction.animation = nil
                }
                .background(
                    CircleBtnAnimationViewEffect(isAnimate: $isShowPortfolio)
                )
            Spacer()
            Text(isShowPortfolio ? "My Portfolio" : "Daily Quote")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .transaction { trans in
                    trans.animation = nil
                }
            Spacer()
            CircleBtnView(iconName: "chevron.right")
                .onTapGesture {
                    withAnimation {
                        self.isShowPortfolio.toggle()
                    }
                }
                .rotationEffect(Angle(degrees: isShowPortfolio ? 180 : 0))
        }
    }
    
    private var allQuoteList: some View {
        List {
            ForEach(viewModel.allQuotes) { quote in
                QuoteRowView(quote: quote, screenW: UIScreen.main.bounds.width)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 1))
                
            }
        }
        .listStyle(.automatic)
    }
    
    private var broughtQuoteList: some View {
        List {
//            ForEach(viewModel.allQuotes) { quote in
//                QuoteRowView(quote: quote)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 1))
//
//            }
        }
        .listStyle(.automatic)
    }
    
    
    private var titleBar: some View {
        
        HStack {
            Text("Symbol")
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .frame(width: UIScreen.main.bounds.width/4, alignment: .leading)
            Spacer()
            Text("Information")
                .frame(width: UIScreen.main.bounds.width/4, alignment: .center)
            Spacer()
            Text("Volume")
                .frame(width: UIScreen.main.bounds.width/4, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            
        }
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
        
    }
    

}



struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StockView()
                .navigationBarHidden(true)
        }
        .environmentObject(DeveloperPreview.initiate.stockViewModel)
    }
}


