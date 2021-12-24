//
//  lines.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import Foundation
import SwiftUI

struct line: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}
