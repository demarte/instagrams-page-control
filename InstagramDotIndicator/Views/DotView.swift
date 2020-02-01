//
//  DotView.swift
//  InstagramDotIndicator
//
//  Created by Ivan De Martino on 1/31/20.
//  Copyright © 2020 Ivan De Martino. All rights reserved.
//

import SwiftUI

struct DotView: View {

  var isSelected: Bool
  var dotSize: DotSize

  var body: some View {
    Circle()
      .frame(width: getSize(for: dotSize), height: getSize(for: dotSize))
      .foregroundColor(isSelected ? Color.green : Color.red)
  }

  private func getSize(for dotSize: DotSize) -> CGFloat {
    switch dotSize {
    case .normal:
      return 15
    case .small:
      return 10
    case .tiny:
      return 5
    }
  }
}

struct DotView_Previews: PreviewProvider {
  static var previews: some View {
    DotView(isSelected: true, dotSize: .tiny)
  }
}

enum DotSize {
  case normal, small, tiny
}
