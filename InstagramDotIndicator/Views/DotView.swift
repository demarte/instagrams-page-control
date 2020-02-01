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

  var body: some View {
    Circle()
      .frame(width: 20, height: 20)
      .foregroundColor(isSelected ? Color.green : Color.red)
  }
}

struct DotView_Previews: PreviewProvider {
  static var previews: some View {
    DotView(isSelected: true)
  }
}
