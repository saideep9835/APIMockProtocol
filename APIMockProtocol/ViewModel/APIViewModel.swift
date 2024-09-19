//
//  APIViewModel.swift
//  APIMockProtocol
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import Foundation

protocol APIFetchData: AnyObject{
    func didFetchData(_ data: DataModel)
    func didGetError(_ error: Error)
}

class APIViewModel{
    
    weak var delegate: APIFetchData?

    func fetchData(){
        guard let url = URL(string: Constants.url.rawValue) else{return}
    APIGetData.shared.getData(modelData: DataModel.self, url: url){ [weak self] result in
        switch result{
        case .success(let data):
            self?.delegate?.didFetchData(data)
        case .failure(let failure):
            self?.delegate?.didGetError(failure)
        }
        }
    }
}
