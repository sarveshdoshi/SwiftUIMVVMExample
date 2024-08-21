//
//  ProductListViewModel.swift
//  SwiftUIMVVMExample
//
//  Created by Sarvesh Doshi on 21/08/24.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    let webService: Webservice
    
    init(webService: Webservice) {
        self.webService = webService
    }
    
    func fetchProducts() async {
        do {
            let products = try await webService.getProducts()
            self.products = products
        } catch {
            print(error)
        }
    }
}
