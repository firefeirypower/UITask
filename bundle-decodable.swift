//
//  bundle-decodable.swift
//  uitask
//
//  Created by Анастасія Локайчук on 18.06.2022.
//

import Foundation
extension Bundle
{
    func  decode <T: Decodable>(_ file:String)-> T{
        guard let url = self.url(forResource: file, withExtension: nil)else
        {
            fatalError("Fail to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url)  else
        {
            fatalError("Fail to load \(file) from bundle")
        }
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else
        {
            fatalError("Fail to decode \(file) in bundle ")
        }
        return loaded
    }
}
