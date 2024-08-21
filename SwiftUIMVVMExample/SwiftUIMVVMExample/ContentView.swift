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
        List(vm.products) { products in
            Text(products.title)
        }.task {
            await vm.fetchProducts()
        }
    }
}

#Preview {
    ContentView()
}
