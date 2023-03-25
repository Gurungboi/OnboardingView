//
//  StepThree.swift
//  OnboardingView
//
//  Created by Sunil Gurung on 25/3/2023.
//

import SwiftUI

struct StepThree: View {
    
    @State private var isAnimating: Bool = false
    @Binding var currentStep: OnboardingStep
    @Binding var currentTab: Int

    
    var body: some View {
        VStack(spacing: 20.0) {
            ZStack {
                GeometryReader { geo in
                    Image("onboarding-3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0, y: 50)
                        .scaleEffect(isAnimating ? 1 : 0.8)
                        .frame(width: geo.size.width ,
                               height: geo.size.height * 0.8)
                }
            }

            
            Text("Increases accountability")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 41 / 255, green: 52 / 255, blue: 73 / 255))
                .scaleEffect(isAnimating ? 1 : 0.4)

            Text("Stay on track and stay motivated - Let your ToDo list be your constant companion.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 237 / 255, green: 203 / 255, blue: 150 / 255))
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                .scaleEffect(isAnimating ? 1 : 0.4)

            Spacer()

            HStack {
                Spacer()
                Button {
                    withAnimation {
                        self.currentStep = .stepOne
                        self.currentTab = 1
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

    }}

struct PageThree_Previews: PreviewProvider {
    static var previews: some View {
        StepThree(currentStep: .constant(.stepOne), currentTab: .constant(1))
    }
}

