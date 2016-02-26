//
//  Initializer.swift
//  Seekster
//
//  Created by Ambas Chobsanti on 1/10/16.
//  Copyright © 2016 SS. All rights reserved.
//

struct InitializerConfiguration {
    let filePath: String
}

protocol Initializer {
    func initializeWithConfiguration(configuration: InitializerConfiguration)
}