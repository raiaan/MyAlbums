//
//  UserInfoViewModel.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import Foundation
import RxSwift

protocol UserInfoViewModelType{
    func loadUserInfo()
    var albums:PublishSubject<Albums>{get}
    var user:PublishSubject<UserModel>{get}
}
class UserInfoViewModel: UserInfoViewModelType{
    let disposeBag = DisposeBag()
    var albums:PublishSubject<Albums> = PublishSubject<Albums>()
    var users:PublishSubject<Users> = PublishSubject<Users>()
    var user:PublishSubject<UserModel> = PublishSubject<UserModel>()
    
    func loadUserInfo(){
        fetchData(url: URLS.users).subscribe(users).disposed(by: disposeBag)
        users.subscribe{[weak self]data in
            guard let element = data.element , let self = self
            else{
                return
            }
            let selectedUser = element.shuffled()[0]
            self.user.onNext(selectedUser)
            selectedUser.id != 0  ? self.loadUserAlbums(userID: selectedUser.id) : nil
        }.disposed(by: disposeBag)
    }
    
    func loadUserAlbums(userID:Int){
        fetchData(url: URLS.albums, parameter: ["userId":userID]).subscribe(albums).disposed(by: disposeBag)
    }
}
