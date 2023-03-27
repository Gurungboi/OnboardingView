//
//  StepTwo.swift
//  OnboardingView
//
//  Created by Sunil Gurung on 25/3/2023.
//

import SwiftUI

struct StepTwo: View {
    @State private var isAnimating: Bool = false
    @Binding var currentStep: OnboardingStep

    var body: some View {
        VStack(spacing: 16.0) {
            ZStack {
                GeometryReader { geo in
                    Image("onboarding-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0, y: 50)
                        .scaleEffect(isAnimating ? 1 : 0.8)
                        .frame(width: geo.size.width,
                               height: geo.size.height * 0.8)
                }
            }

            Text("Helps with organization")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .scaleEffect(isAnimating ? 1 : 0.4)

            Text("Organize your day, conquer your tasks - Let your ToDo list be your trusted guide.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.sRGB, red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                .scaleEffect(isAnimating ? 1 : 0.4)

            Spacer()

            HStack {
                Spacer()
                Button {
                    withAnimation {
                        self.currentStep = .stepThree
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding(15)
                        .background(Circle())
                }
                .padding()
            }

            Spacer()

        }
        .padding(.horizontal, 16)
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
    }

}

struct StepTwo_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(currentStep: .constant(.stepThree))
    }
}
