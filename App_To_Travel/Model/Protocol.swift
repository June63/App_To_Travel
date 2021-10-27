//
//  Protcol.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation

// Protocol for passing data
protocol IsAbleToReceiveData: NSObjectProtocol {
    func passCurrency(_ data: String)
    func passCity(_ data: City)
}

extension IsAbleToReceiveData {
    func passCurrency(_ data: String) {}
    func passCity(_ data: City) {}
}
