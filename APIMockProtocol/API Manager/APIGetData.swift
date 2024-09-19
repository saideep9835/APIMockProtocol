//
//  APIGetData.swift
//  APIMockProtocol
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import Foundation

class APIGetData{
    
    static let shared = APIGetData()
    
    private init(){ }
    
    func getData<T: Codable>(modelData: T.Type, url: URL, completion: @escaping(Result<T, Error>) -> Void){
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard response is HTTPURLResponse else{
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey:"Didn't get the data"])
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey:"No Data"])
                completion(.failure(error))
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}
