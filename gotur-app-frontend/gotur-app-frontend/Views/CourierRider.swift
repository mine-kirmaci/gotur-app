//
//  SwiftUIView.swift
//  gotur-app-frontend
//
//  Created by Mine Kırmacı on 15.08.2025.
//

import SwiftUI


struct CourierRider: View {
    var assetName: String = "kurye"   // Assets.xcassets -> kurye
    var height: CGFloat = 120
    var duration: Double = 6          // soldan sağa geçiş süresi (sn)

    private var fallback: Image { Image(systemName: "bicycle") }

    var body: some View {
        GeometryReader { geo in
            TimelineView(.animation) { timeline in
                // 0..1 arası döngüsel progress
                let t = timeline.date.timeIntervalSinceReferenceDate
                let progress = t.truncatingRemainder(dividingBy: duration) / duration

                // solda görünmezden başla, sağda görünmezde bitir
                let startX = -height * 1.8
                let endX = geo.size.width + height * 1.8
                let x = startX + (endX - startX) * progress

                ZStack(alignment: .bottomLeading) {
                    // ince zemin çizgisi (opsiyonel)
                    Rectangle()
                        .fill(Color.black.opacity(0.06))
                        .frame(height: 2)
                        .offset(y: -2)

                    // asset varsa onu, yoksa sembolü çiz
                    (UIImage(named: assetName) != nil ? Image(assetName) : fallback)
                        .resizable()
                        .scaledToFit()
                        .frame(height: height)
                        .offset(x: x)
                        .accessibilityLabel("Kurye animasyonu")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: height + 24)
        .background(Color.clear)
        .allowsHitTesting(false)
        .zIndex(999)
    }
}


#Preview {
    CourierRider()
}
