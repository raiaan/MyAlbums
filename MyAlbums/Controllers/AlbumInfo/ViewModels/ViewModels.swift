//
//  ViewModels.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/4/23.
//

import Foundation
import RxSwift

protocol albumsDetailsViewModelType{
    var albumsInfo:PublishSubject<AlbumsDetailsResponse> {get}
    func loadAlbumsInfo()
}
class albumsDetailsViewModel:albumsDetailsViewModelType{
    let disposeBag = DisposeBag()
    var albumsInfo:PublishSubject<AlbumsDetailsResponse> = PublishSubject<AlbumsDetailsResponse>()
    var id:Int
    init(id:Int){
        self.id = id
    }
    func loadAlbumsInfo(){
        fetchData(url: URLS.photos, parameter: ["albumId":id]).subscribe(albumsInfo).disposed(by: disposeBag)
    }
}
