//
//  DotIndicatorView.swift
//  InstagramDotIndicator
//
//  Created by Ivan De Martino on 1/31/20.
//  Copyright © 2020 Ivan De Martino. All rights reserved.
//

import SwiftUI

struct DefaultDotIndicatorView: View {

  var numberOfPages: Int
  @Binding var selectedIndex: Int

  var body: some View {
    HStack {
      ForEach(1...numberOfPages, id: \.self) { index in
        DotView(
          isSelected: self.selectedIndex == index,
          dotSize: .normal
        )
      }
    }
  }
}

struct DotIndicatorView_Previews: PreviewProvider {
  static var previews: some View {
    DefaultDotIndicatorView(numberOfPages: 5, selectedIndex: .constant(1))
  }
}
