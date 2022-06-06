//
//  ProductService.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//

import Foundation
import SwiftyJSON

class ProductService {
    static let sharedInstance = ProductService()
    
    func getAllProducts(onSuccess: @escaping(Data) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = "https://sephoraios.github.io/items.json" // this is just a hard-cored url
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if (error != nil){
                onFailure(error!)
            } else {
                onSuccess(data!)
            }
        })
        task.resume()
    }
    
    
}

