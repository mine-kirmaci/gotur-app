//
//  LoginView.swift
//  gotur-app-frontend
//
//  Created by Mine Kırmacı on 14.08.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showRegister = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
                // Üstte logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .overlay(
                        Rectangle()
                            .fill(Color.white.opacity(0.25))
                            .frame(height: 0.5),
                        alignment: .bottom
                    )
                    .shadow(color: Color.black.opacity(0.5), radius: 8, x: 0, y: 4)

                // Form alanları
                VStack(spacing: 15) {
                    TextField("E-posta", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    SecureField("Şifre", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)

                // Giriş butonu
                Button(action: { login() }) {
                    Text("Giriş Yap")
                        .frame()
                        .padding()
                        .background(Color(hex: "#5D3EBC"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // "Hâlâ kayıtlı değil misin?"
                HStack {
                    Text("Hâlâ kayıtlı değil misin?")
                        .foregroundColor(.gray)
                    Button("Kayıt Ol") {
                        showRegister = true
                    }
                    .foregroundColor(Color(hex: "#5D3EBC"))
                    .fontWeight(.semibold)
                }
                .padding(.top, 5)

                Spacer()

                // Navigation yönlendirmeleri
                NavigationLink("", destination: RegisterView(), isActive: $showRegister)
            }
            .padding()
            .safeAreaInset(edge: .bottom) {
                CourierRider(assetName: "kurye", height: 120, duration: 6)
            }

        }
    }

    func login() {
//        APIService.shared.login(email: email, password: password) { success in
 //           DispatchQueue.main.async {
 //               isLoggedIn = success
//            }
//        }
    }
}

#Preview {
    LoginView()
}

