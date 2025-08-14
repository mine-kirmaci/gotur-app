//
//  HeaderView.swift
//  gotur-app-frontend
//
//  Created by Mine Kırmacı on 14.08.2025.
//

import SwiftUI

struct HeaderView: View {
    var showsBackButton: Bool = false
    var rightIcon: Image? = nil
    var onBack: (() -> Void)? = nil
    var onRightIcon: (() -> Void)? = nil

    var body: some View {
        ZStack {
            // Mor degrade arka plan
            LinearGradient(
                colors: [Color(hex: "#5D3EBC"), Color(hex: "#6B4FD6")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(edges: .top)

            HStack {
                // Sol alan (geri butonu ya da boş yer)
                if showsBackButton {
                    Button(action: { onBack?() }) {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                    }
                } else {
                    Color.clear.frame(width: 44, height: 44)
                }

                Spacer()

                // ORTADAKİ BAŞLIK (metin “götür”)
                Text("götür")
                    .font(.system(size: 55, weight: .black, design: .rounded))
                    .foregroundColor(Color(hex: "#FFD100")) // getir sarısı
                    .accessibilityLabel("Uygulama Logosu")
                    .padding(.top, 55)
                    .frame(alignment: .center)

                Spacer()

                // Sağ alan (opsiyonel ikon)
                if let rightIcon {
                    Button(action: { onRightIcon?() }) {
                        rightIcon
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                    }
                } else {
                    Color.clear.frame(width: 44, height: 44)
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 6)
        }
        .frame(height: 125)
        .overlay(
            Rectangle()
                .fill(Color.white.opacity(0.25))
                .frame(height: 0.5),
            alignment: .bottom
        )
        .shadow(color: Color.black.opacity(0.5), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    VStack(spacing: 15) {
        HeaderView()
        Spacer().frame(maxWidth: .infinity)
            .background(Color(.systemGroupedBackground))
    }
    .edgesIgnoringSafeArea(.top)
}
