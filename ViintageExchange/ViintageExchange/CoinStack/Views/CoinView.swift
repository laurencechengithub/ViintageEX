//
//  CoinView.swift
//  ViintageExchange
//
//  Created by LaurenceMBP2 on 2022/7/7.
//

import SwiftUI

struct CoinView: View {
    
    @StateObject private var viewModel = CoinViewModel()
    @State private var isShowPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.bg
            
            
            VStack {
                
                homeHeader
//                columnTitles
                if isShowPortfolio == true {
                    
                } else {
                    allCoinsList
                }
                Spacer()
                
            }
            
            
        }

    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoinView()
                  .navigationBarHidden(true)
          }
    }
}


extension CoinView {
    
    private var homeHeader: some View {
        HStack {
            CircleBtnView(iconName: isShowPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if isShowPortfolio {
                        isShowPortfolio.toggle()
                    } else {
                        isShowPortfolio.toggle()
                    }
                }
                .background(
                    CircleBtnAnimationViewEffect(isAnimate: $isShowPortfolio)
                )
            Spacer()
            Text(isShowPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleBtnView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isShowPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isShowPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
        
    private var allCoinsList: some View {
        List {
            ForEach(viewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowBackground(Color.theme.bg)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    
//    private var columnTitles: some View {
//         HStack {
//             HStack(spacing: 4) {
//                 Text("Coin")
//                 Image(systemName: "chevron.down")
//                     .opacity((viewModel.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
//                     .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
//             }
//             .onTapGesture {
//                 withAnimation(.default) {
//                     viewModel.sortOption = viewModel.sortOption == .rank ? .rankReversed : .rank
//                 }
//             }
//
//             Spacer()
//             if isShowPortfolio {
//                 HStack(spacing: 4) {
//                     Text("Holdings")
//                     Image(systemName: "chevron.down")
//                         .opacity((viewModel.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
//                         .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
//                 }
//                 .onTapGesture {
//                     withAnimation(.default) {
//                         viewModel.sortOption = viewModel.sortOption == .holdings ? .holdingsReversed : .holdings
//                     }
//                 }
//             }
//             HStack(spacing: 4) {
//                 Text("Price")
//                 Image(systemName: "chevron.down")
//                     .opacity((viewModel.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
//                     .rotationEffect(Angle(degrees: viewModel.sortOption == .price ? 0 : 180))
//             }
//             .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
//             .onTapGesture {
//                 withAnimation(.default) {
//                     viewModel.sortOption = viewModel.sortOption == .price ? .priceReversed : .price
//                 }
//             }
//
//             Button(action: {
//                 withAnimation(.linear(duration: 2.0)) {
//                     viewModel.reloadData()
//                 }
//             }, label: {
//                 Image(systemName: "goforward")
//             })
//             .rotationEffect(Angle(degrees: viewModel.isLoading ? 360 : 0), anchor: .center)
//         }
//         .font(.caption)
//         .foregroundColor(Color.theme.secondaryText)
//         .padding(.horizontal)
//     }
    
    
}
