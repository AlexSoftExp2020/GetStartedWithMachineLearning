//
//  Styles.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import SwiftUI

struct CellStyle: ViewModifier {
    var cornerRadius: CGFloat = 15.0
    var padding: CGFloat = 15.0
    var disabled: Bool = false
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(disabled ? Color.gray : .black)
            .padding(padding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(disabled ? Color.gray : Color.accent)
                    .brightness(disabled ? 0.3 : 0.5)
            }
    }
}
