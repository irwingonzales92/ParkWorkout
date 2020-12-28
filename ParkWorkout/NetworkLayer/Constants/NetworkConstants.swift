//
//  NetworkConstants.swift
//  CalendarApp
//
//  Created by Irwin Gonzales on 12/23/20.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
}

enum Endpoint: String {
    case createNotes = "/notes/create"
    case postUserSignup = "/users/post-user-signup"
    case userData = "/users/data"
    case partnerSessions = "/partners/sessions"
    case trainerCode = "/users/trainer-code"
    case joinPartners = "/partners/join"
    case sessions = "/sessions?"
    case upcomingSessions = "/sessions/upcoming"
    case partners = "/partners"
    case getNotes = "/notes/fetch-note?id="
    
}

enum ApiError: Error {
    case reponseProblem
    case decodingProblem
    case encodingProblem
    case otherProblem
}

enum APIError: Error {
    case unknown

    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error"
        }
    }
}
