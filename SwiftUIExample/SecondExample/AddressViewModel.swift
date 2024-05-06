//
//  AddressViewModel.swift
//  SwiftUIExample
//
//  Created by Yago Pereira on 6/5/24.
//

import SwiftUI
import Combine

final class AddressViewModel: ObservableObject {
    @Published var cep: String = ""
    @Published var street: String = ""
    @Published var neighborhood: String = ""
    @Published var city: String = ""
    @Published var state: String = ""

    private var cancellable: AnyCancellable?

    func fetchAddress() {
        guard cep.count == 8 else { return }
        let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Address.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] address in
                guard let self else { return }
                street = address.logradouro
                neighborhood = address.bairro
                city = address.localidade
                state = address.uf
            })
    }
}

struct Address: Codable {
    let logradouro, bairro, localidade, uf: String
}
