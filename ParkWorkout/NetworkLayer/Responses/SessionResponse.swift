//
//  SessionResponse.swift
//  CalendarApp
//
//  Created by Irwin Gonzales on 12/23/20.
//

import Foundation

class SessionsResponse: Codable, ObservableObject {
//    var sessions : [Session]
    
    enum CodingKeys: CodingKey {
        case session
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy:
        CodingKeys.self, forKey: .session)
        print(response)
//        self.sessions = try response.decode([Session].self, forKey: .session)
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
        let response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .session)
        print(response)
//      try response.encode(self.sessions, forKey: .session)
     }
}
