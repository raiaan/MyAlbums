//
//  NetworkCall.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
import RxSwift
import Alamofire

func fetchData<T :Codable>(url:String ,parameter:[String:Any]? = nil) -> Observable<T> {
    return Observable.create { (observer) -> Disposable in
        let request = AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default)
        request.responseJSON { (response: AFDataResponse<Any>) in
            print(url)
            print(parameter)
            switch response.result{
            case .success(let data):
                do {
                    print(data)
                    if let data = response.data{
                        let jobsData = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(jobsData)
                    }
                    // observer.onCompleted()
                } catch {
                    print(error)
                    observer.onError(error)
                }
            case .failure(let error):
                print(error)
               // observer.onError(error)
            }
            
        }
        return Disposables.create()
    }
}
