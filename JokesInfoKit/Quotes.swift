//
//  Quotes.swift
//  Jokes
//
//  Created by Thao Doan on 7/5/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

//class Quotes{
//    struct Constants {
//        static let quoteKey = "quote"
//        static let authorKey = "author"
//        static let dateKey = "date"
//        static let titleKey = "title"
//        static let background = "background"
//    }
//    var quote : String
//    var author : String
//    var date: String
//    var title : String
//    var background : String
//    init(quote: String, author: String, date : String, title: String, background: String) {
//        self.quote = quote
//        self.author = author
//        self.date = date
//        self.title = title
//        self.background = background
//    }
//    init?(jsonDictionary: [String:Any]) {
//        guard let title = jsonDictionary[Constants.titleKey] as? String,
//              let author = jsonDictionary[Constants.authorKey] as? String,
//              let date = jsonDictionary[Constants.dateKey] as? String,
//            let quote = jsonDictionary[Constants.quoteKey] as? String else {return nil}
//        let background = jsonDictionary[Constants.background] as? String ?? ""
//        self.title = title
//        self.author = author
//        self.date = date
//        self.quote = quote
//        self.background = background
//    }
//
//    //MARK: JSON Representation
//
//    var dictionaryRepresentation : [String: Any] {
//        let dictionary: [String:Any] = [Constants.quoteKey : self.quote,
//                                        Constants.authorKey : self.author,
//                                        Constants.dateKey : self.date,
//                                        Constants.titleKey : self.title,
//                                        Constants.background : self.background]
//        return dictionary
//    }
//
//    var jsonData : Data? {
//        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
//    }
//
//
//}

public struct Quotes : Codable{
       public var quote : String
       public var author : String
       public var date: String
       public var title : String
        public var background : String
    
}
public struct Contents: Codable {
   public let quotes : [Quotes]
}

public struct ToplevelData: Codable {
   public let contents : Contents
}

