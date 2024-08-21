//
//  ContentView.swift
//  SwiftUIMVVMExample
//
//  Created by Sarvesh Doshi on 21/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webService: Webservice())
    
    var body: some View {
        List(vm.products) { product in
            HStack {
                VStack {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 72, height: 72)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    
                }

                
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.title)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                    Text(product.description)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                    Text(product.category)
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                    HStack {
                        Text(product.price as NSNumber, formatter: NumberFormatter.currency)
                            .fontWeight(.heavy)
                        Spacer()
                        HStack {
                            Text("\(product.rating.rate?.formatted() ?? "")")
                                .fontWeight(.semibold)
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            
        }.task {
            await vm.fetchProducts()
        }
    }
}

#Preview {
    ContentView()
}
