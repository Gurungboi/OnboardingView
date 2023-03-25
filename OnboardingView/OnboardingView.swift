//
//  OnboardingView.swift
//  OnboardingView
//
//  Created by Sunil Gurung on 25/3/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep: OnboardingStep = .stepOne

    var body: some View {
        // Note: Without Tabview
        //        switch currentStep {
        //        case .onboarding1:
        //            PageOne(currentStep: $currentStep)
        //        case .onboarding2:
        //            PageTwo(currentStep: $currentStep)
        //        case .onboarding3:
        //            PageThree(currentStep: $currentStep)
        //        }

        // Note: With Tabview

        TabView(selection: $currentStep,
                content: {
            StepOne(currentStep: self.$currentStep)
                .tag(OnboardingStep.stepOne)
            StepTwo(currentStep: self.$currentStep)
                .tag(OnboardingStep.stepTwo)
            StepThree(currentStep: self.$currentStep)
                .tag(OnboardingStep.stepThree)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
