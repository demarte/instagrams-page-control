//
//  ContentView.swift
//  InstagramDotIndicator
//
//  Created by Ivan De Martino on 1/31/20.
//  Copyright © 2020 Ivan De Martino. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State var selectedIndex = 1

  var body: some View {
    VStack {
      Spacer()
      VStack {
        Button(action: {
          self.selectedIndex -= 1
        }) {
          Text("Back")
        }
      }
      Spacer()
      Button(action: {
        self.selectedIndex += 1
      }) {
        Text("Forward")
      }
      Spacer()
      DotIndicatorView(numberOfPages: 5, selectedIndex: $selectedIndex)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
