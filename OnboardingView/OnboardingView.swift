//
//  OnboardingView.swift
//  OnboardingView
//
//  Created by Sunil Gurung on 25/3/2023.
//

import SwiftUI

struct OnboardingView: View {
    // Note: With Tabview
    @State private var currentTab = 1

    // Note: Without Tabview
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

        TabView(selection: $currentTab,
                content: {
            StepOne(currentStep: $currentStep, currentTab: $currentTab)
                .tag(1)
            StepTwo(currentStep: $currentStep, currentTab: $currentTab)
                .tag(2)
            StepThree(currentStep: $currentStep, currentTab: $currentTab)
                .tag(3)
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
