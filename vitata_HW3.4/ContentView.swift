//
//  ContentView.swift
//  vitata_HW3.4
//
//  Created by Andrew Tolstov on 7/29/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var currentValue: Double = 50
	@State private var showAlert = false
	@State private var targetValue = Int.random(in: 1...100)
	
    var body: some View {
		
		VStack {
			Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
	
			HStack {
				Text("0")
				ColorUISlider(value: $currentValue, alpha: computeScore())
				Text("100")
			}
			.padding([.bottom, .leading, .trailing])

			Button("Проверь меня", action: { self.showAlert = true })
				.padding(.bottom)
			Button("Начать заново!", action: restart)
		}
		.padding()
        .alert(isPresented: .constant(showAlert)) {
            Alert(
                title: Text("Your Score"),
                message: Text("\(computeScore())"),
				dismissButton: .default(Text("OK")) {
					self.showAlert = false
				}
            )
        }

    }

}

extension ContentView {
	
	private func computeScore() -> Int {
		let difference = abs(targetValue - lround(currentValue))
		return 100 - difference
	}
	
	private func restart() {
		targetValue = Int.random(in: 1...100)
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
