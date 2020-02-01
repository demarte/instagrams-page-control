//
//  DotIndicatorView.swift
//  InstagramDotIndicator
//
//  Created by Ivan De Martino on 1/31/20.
//  Copyright © 2020 Ivan De Martino. All rights reserved.
//

import SwiftUI

struct DotIndicatorView: View {

  var numberOfPages: Int
  @Binding var selectedPage: Int
  @Binding var selectedDotIndex: Int
  @Binding var currentStatus: DotIndicatorStatus

  let statusTack: [DotIndicatorStatus] = [.begin, .almostBegin, .almostEnd, .end]

  var body: some View {
    VStack {
      ZStack {
        Ellipse()
          .frame(width: 60, height: 50, alignment: .center)
          .foregroundColor(Color.black)
        Text("\(selectedPage)/\(numberOfPages)")
        .foregroundColor(Color.white)
      }
      if numberOfPages > Constants.minimumOfPages {
        self.buildFlexibleDots()
      } else {
        self.buildDefaultDots()
      }
    }
  }

  private func buildDefaultDots() -> AnyView {
    return AnyView (
      HStack {
        ForEach(1...numberOfPages, id: \.self) { index in
          DotView(
            isSelected: self.selectedPage == index,
            dotSize: .normal
          )
        }
      }
    )
  }

  private func buildFlexibleDots() -> AnyView {
    switch currentStatus {
    case .begin:
      return AnyView (
        HStack {
          ForEach(1...Constants.numberOfDotsPerPage, id: \.self) { index in
            DotView(
              isSelected: self.selectedDotIndex == index,
              dotSize: .normal
            )
          }
          DotView(
            isSelected: false,
            dotSize: .small
          )
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
        }
      )
    case .almostBegin:
      return AnyView (
        HStack {
          DotView(
            isSelected: false,
            dotSize: .small
          )
          ForEach(1...Constants.numberOfDotsPerPage, id: \.self) { index in
            DotView(
              isSelected: self.selectedDotIndex == index,
              dotSize: .normal
            )
          }
          DotView(
            isSelected: false,
            dotSize: .small
          )
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
        }
      )
    case .middle:
      return AnyView (
        HStack {
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
          DotView(
            isSelected: false,
            dotSize: .small
          )
          ForEach(1...Constants.numberOfDotsPerPage, id: \.self) { index in
            DotView(
              isSelected: self.selectedDotIndex == index,
              dotSize: .normal
            )
          }
          DotView(
            isSelected: false,
            dotSize: .small
          )
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
        }
      )
    case .almostEnd:
      return AnyView (
        HStack {
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
          DotView(
            isSelected: false,
            dotSize: .small
          )
          ForEach(1...Constants.numberOfDotsPerPage, id: \.self) { index in
            DotView(
              isSelected: self.selectedDotIndex == index,
              dotSize: .normal
            )
          }
          DotView(
            isSelected: false,
            dotSize: .small
          )
        }
      )
    case .end:
      return AnyView (
        HStack {
          DotView(
            isSelected: false,
            dotSize: .tiny
          )
          DotView(
            isSelected: false,
            dotSize: .small
          )
          ForEach(1...Constants.numberOfDotsPerPage, id: \.self) { index in
            DotView(
              isSelected: self.selectedDotIndex == index,
              dotSize: .normal
            )
          }
        }
      )
    }
  }
}

struct DotIndicatorView_Previews: PreviewProvider {
  static var previews: some View {
    DotIndicatorView(numberOfPages: 6, selectedPage: .constant(1), selectedDotIndex: .constant(1), currentStatus: .constant(.begin))
  }
}

struct Constants {
  static let minimumOfPages: Int = 5
  static let numberOfDotsPerPage: Int = 3
}

enum DotIndicatorStatus {
  case begin
  case almostBegin
  case middle
  case almostEnd
  case end
}

