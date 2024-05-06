//
//  AddressView.swift
//  SwiftUIExample
//
//  Created by Yago Pereira on 6/5/24.
//

import SwiftUI
import Combine

struct AddressView: View {
    @ObservedObject var viewModel = AddressViewModel()

    var body: some View {
        VStack {
            TextField("Digite o CEP", text: $viewModel.cep)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onReceive(Just(viewModel.cep)) {  _ in
                    viewModel.fetchAddress()
                }

            TextField("Rua", text: $viewModel.street)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Bairro", text: $viewModel.neighborhood)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Cidade", text: $viewModel.city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Estado", text: $viewModel.state)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    AddressView()
        .background(Color.cyan)
}
