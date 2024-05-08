//
//  PropertyWrappers.swift
//  SwiftUIExample
//
//  Created by Yago Pereira on 7/5/24.
//


import SwiftUI
import Combine

struct MainView: View {
    @StateObject var userData = UserData()
    @StateObject var addressViewModel = AddressViewModel()
    @StateObject var userPreference = UserPreference()
    private var defaultNotificationPreferenceValue = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Usuário").font(.headline)) {
                    UserAndAddressEditor()
                        .padding(.vertical, 8)
                }
                Section(header: Text("Endereço").font(.headline)) {
                    AddressDetails()
                }
                Section {
                    NavigationLink(
                        "Ver Perfil Completo",
                        destination: UserProfileView()
                            .environmentObject(userData)
                            .environmentObject(addressViewModel)
                    )
                }
                Section {
                    NavigationLink(
                        "Configurações de Notificações",
                        destination: NotificationSettingsView(
                            userPreference: userPreference,
                            defaultNotificationPreferenceValue: defaultNotificationPreferenceValue
                        )
                    )
                }
            }
            .environmentObject(userData)
            .environmentObject(addressViewModel)
            .navigationBarTitle("Configurações")
        }
    }
}

struct NotificationSettingsView: View {
    @ObservedObject var userPreference: UserPreference
    let defaultNotificationPreferenceValue: Bool

    var body: some View {
        Form {
            Toggle(
                "Habilitar Notificações",
                isOn: $userPreference.notificationsEnabled
            )
        }
        .onAppear {
            userPreference.notificationsEnabled = defaultNotificationPreferenceValue
        }
        .navigationBarTitle("Notificações")
    }
}

struct UserAndAddressEditor: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var addressViewModel: AddressViewModel

    var body: some View {
        VStack(spacing: 12) {
            TextField("Nome", text: $userData.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("CEP", text: $addressViewModel.cep)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: { addressViewModel.fetchAddress() }) {
                HStack {
                    if addressViewModel.isLoading {
                        ProgressView()
                            .foregroundColor(.white)

                    } else {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar Endereço")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
        }
        .padding(.horizontal, 4)
    }
}

struct AddressDetails: View {
    @EnvironmentObject var addressViewModel: AddressViewModel

    var body: some View {
        Text("Rua: \(addressViewModel.street)")
        Text("Bairro: \(addressViewModel.neighborhood)")
        Text("Cidade: \(addressViewModel.city)")
        Text("Estado: \(addressViewModel.state)")
    }
}

struct UserProfileDetails: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        Text("Nome: \(userData.name)")
    }
}

struct UserProfileView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var addressViewModel: AddressViewModel

    var body: some View {
        Form {
            Section(header: Text("Informações do Usuário").font(.headline)) {
                Text("Nome: \(userData.name)")
            }
            Section(header: Text("Informações de Endereço").font(.headline)) {
                Text("Rua: \(addressViewModel.street)")
                Text("Bairro: \(addressViewModel.neighborhood)")
                Text("Cidade: \(addressViewModel.city)")
                Text("Estado: \(addressViewModel.state)")
            }
        }
        .navigationBarTitle("Perfil Completo")
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

#Preview {
    MainView()
}
