//
//  HomeCoachCalendarTheme.swift
//  RemoteCoach
//
//  Created by Irwin Gonzales on 9/12/20.
//  Copyright © 2020 Irwin Gonzales. All rights reserved.
//

import SwiftUI

public struct HomeCoachCalendarTheme: Equatable, Hashable {
    public let primary: Color

    public init(primary: Color) {
        self.primary = primary
    }
}

public extension HomeCoachCalendarTheme {
    static let allThemes: [HomeCoachCalendarTheme] = [.babyPowder, .babyPurple, .deepChampange, .electricIndego, .failure, .gunMetal, .success, .warning]

    static let babyPowder = HomeCoachCalendarTheme(primary: .babyPowder)
    static let babyPurple = HomeCoachCalendarTheme(primary: .babyPurple)
    static let deepChampange = HomeCoachCalendarTheme(primary: .deepChampange)
    static let electricIndego = HomeCoachCalendarTheme(primary: .electricIndego)
    static let failure = HomeCoachCalendarTheme(primary: .failure)
    static let gunMetal = HomeCoachCalendarTheme(primary: .gunMetal)
    static let success = HomeCoachCalendarTheme(primary: .success)
    static let warning = HomeCoachCalendarTheme(primary: .warning)
}

extension HomeCoachCalendarTheme {
    static let `default`: HomeCoachCalendarTheme = .babyPurple
}

struct HomeCoachCalendarThemeKey: EnvironmentKey {
    static let defaultValue: HomeCoachCalendarTheme = .default
}

extension EnvironmentValues {
    var calendarTheme: HomeCoachCalendarTheme {
        get { self[HomeCoachCalendarThemeKey.self] }
        set { self[HomeCoachCalendarThemeKey.self] = newValue }
    }
}

private extension Color {
    static let babyPowder = Color("BabyPowder")
    static let babyPurple = Color("BabyPurple")
    static let deepChampange = Color("DeepChampange")
    static let electricIndego = Color("ElectricIndego")
    static let failure = Color("Failure")
    static let gunMetal = Color("GunMetal")
    static let success = Color("success")
    static let warning = Color("warning")
}
