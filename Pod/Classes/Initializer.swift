//
//  Initializer.swift
//  Impala
//
//  Created by Ambas Chobsanti on 1/10/16.
//  Copyright © 2016 AM. All rights reserved.
//

struct InitializerConfiguration {
    let filePath: String
}

protocol Initializer {
    func initializeWithConfiguration(configuration: InitializerConfiguration)
}