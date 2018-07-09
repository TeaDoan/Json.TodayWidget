//
//  QuotesController.swift
//  Jokes
//
//  Created by Thao Doan on 7/5/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

public class QuotesController {
   public struct Constants {
        static let baseUrl =  URL(string: "http://quotes.rest/qod.json")
    }
 public  static func fetchQuote (completion: @escaping ([Quotes]?) -> Void){
        guard let url = Constants.baseUrl else {
            print("Error with baseURL")
            completion(nil)
            return}
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
        if let error = error {
            print("Error downloading quotes with Datatask : \(error)")
            completion(nil)
            return
        }
        guard let data = data else {completion(nil); return}
        
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let dictict = try jsonDecoder.decode(ToplevelData.self, from: data)
            let quote = dictict.contents.quotes
            completion(quote)
            
        } catch let error {
            print("Error decoding quotes from data task: \(error.localizedDescription)")
            completion(nil)
            return
      }
    }.resume()
    
  }
    
  public  static func fetchImage(withURL : String, completion: @escaping ((UIImage?)-> Void)){
        //URL
        guard let url = URL(string: withURL) else {completion(nil); return}
        //Request
        var request = URLRequest(url: url)
        request.httpBody = nil
        request.httpMethod = "GET"
        //DataTask + Resume + Decode
        let session = URLSession.shared.dataTask(with: request) { (data,_, error) in
            if let error = error {
                print("\(error)")
                completion(nil)
                return
            }
            guard let data = data,
                let image = UIImage(data: data) else {completion(nil);return}
            completion(image)
        };session.resume()
    }
    
}
