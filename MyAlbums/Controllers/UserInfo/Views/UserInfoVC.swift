//
//  UserInfoVC.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import UIKit
import RxSwift
import RxCocoa

class UserInfoVC: UIViewController {
    //MARK: outlets Data
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userDataStack: UIStackView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var albumsTable: UITableView!
    
    //MARK: variables
    var disposeBag = DisposeBag()
    var viewModel:UserInfoViewModelType
    init(viewModel:UserInfoViewModelType){
        self.viewModel = viewModel
        super.init(nibName: "UserInfoVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUserData()
        bindAlbums()
        viewModel.loadUserInfo()
    }
    func bindUserData(){
        viewModel.user.subscribe{[weak self]value in
            guard let element = value.element , let self = self
            else{return}
            self.userName.text = element.name
            self.address.text = "\(element.address.city), \(element.address.city), \(element.address.suite)"
        }.disposed(by: disposeBag)
    }
    func bindAlbums(){
        self.albumsTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewModel.albums.bind(to: albumsTable.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){row , element , cell in
            cell.textLabel?.text = element.title
        }
    }
}
