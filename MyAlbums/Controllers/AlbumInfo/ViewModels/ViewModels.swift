//
//  ViewModels.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/4/23.
//

import Foundation
import RxSwift
import RxRelay
protocol albumsDetailsViewModelType{
    var albumsInfo:BehaviorRelay<AlbumsDetailsResponse> {set get}
    var filtersAlbumsInfo:PublishSubject<AlbumsDetailsResponse> {set get}
    func loadAlbumsInfo()
    func searchFunction(query:String)
}
class albumsDetailsViewModel:albumsDetailsViewModelType{
    let disposeBag = DisposeBag()
    var albumsInfo:BehaviorRelay<[AlbumDetailsModel]> = BehaviorRelay<[AlbumDetailsModel]>(value: [])
    var filtersAlbumsInfo: PublishSubject<[AlbumDetailsModel]> = PublishSubject<[AlbumDetailsModel]>()
    var id:Int
    init(id:Int){
        self.id = id
    }
    func loadAlbumsInfo(){
        print(id)
        fetchData(url: URLS.photos, parameter: ["albumId":id]).bind(to: albumsInfo).disposed(by: disposeBag)
        albumsInfo.bind(to: filtersAlbumsInfo).disposed(by: disposeBag)
    }
    
    func searchFunction(query:String){
        if query.isEmpty{
            filtersAlbumsInfo.onNext(albumsInfo.value)
            return
        }
        filtersAlbumsInfo.onNext(albumsInfo.value.filter{
            $0.title.contains(query)
        })
    }
}
