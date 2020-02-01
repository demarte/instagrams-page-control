//
//  ContentView.swift
//  InstagramDotIndicator
//
//  Created by Ivan De Martino on 1/31/20.
//  Copyright © 2020 Ivan De Martino. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  let numberOfPages = 11
  @State var statusTack: [DotIndicatorStatus] = []
  @State var statusTrackIndex = 0
  @State var dotSelectedIndex = 1
  @State var selectedPage = 1
  @State var currentStatus: DotIndicatorStatus = .begin

  var body: some View {
    VStack {
      Spacer()
      VStack {
        Button(action: {
          if self.selectedPage > 1 {
            self.selectedPage = self.selectedPage - 1
            self.dotSelectedIndex = self.dotSelectedIndex - 1
            self.calculateSelectedIndexBackward()
          }
        }) {
          Text("Back")
        }
      }
      Spacer()
      Button(action: {
        if self.selectedPage < self.numberOfPages {
          self.selectedPage = self.selectedPage + 1
          self.dotSelectedIndex = self.dotSelectedIndex + 1
          self.calculateSelectedIndexForward()
        }
      }) {
        Text("Forward")
      }
      Spacer()
      DotIndicatorView(numberOfPages: numberOfPages, selectedPage: $selectedPage, selectedDotIndex: $dotSelectedIndex, currentStatus: $currentStatus)
    }.onAppear {
      self.buildStatusTrack()
    }
  }

  private func buildStatusTrack() {
    self.statusTack.append(.begin)
    self.statusTack.append(.almostBegin)

    let numberOfMiddleElements = numberOfPages - Constants.numberOfDotsPerPage - 3
    if numberOfMiddleElements > 0 {
      for _ in 1...numberOfMiddleElements {
        self.statusTack.append(.middle)
      }
    }

    self.statusTack.append(.almostEnd)
    self.statusTack.append(.end)
    print(statusTack)
  }

  private func calculateSelectedIndexForward() {
    if dotSelectedIndex > Constants.numberOfDotsPerPage {
      self.statusTrackIndex += 1
      self.dotSelectedIndex = Constants.numberOfDotsPerPage
      self.currentStatus = statusTack[statusTrackIndex]
    }
  }

  private func calculateSelectedIndexBackward() {
    if dotSelectedIndex < 1 {
      self.statusTrackIndex -= 1
      self.dotSelectedIndex = 1
      self.currentStatus = statusTack[statusTrackIndex]
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
