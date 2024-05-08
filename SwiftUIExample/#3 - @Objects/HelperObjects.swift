//
//  HelperObjects.swift
//  SwiftUIExample
//
//  Created by Yago Pereira on 7/5/24.
//

import Foundation

class UserData: ObservableObject {
    @Published var name: String = ""
}

class UserPreference: ObservableObject {
    @Published var notificationsEnabled: Bool = false
}
