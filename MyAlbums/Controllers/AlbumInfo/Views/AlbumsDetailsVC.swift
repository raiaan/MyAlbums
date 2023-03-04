//
//  AlbumsDetailsVC.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import UIKit
import RxCocoa

class AlbumsDetailsVC: UIViewController {
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var albumsImages: UICollectionView!
    @IBOutlet weak var searchContainerStack: UIStackView!
    var viewModel:albumsDetailsViewModelType
    var albumTitle:String?
    init(viewModel:albumsDetailsViewModelType){
        self.viewModel = viewModel
        super.init(nibName: "AlbumsDetailsVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleUI()
        bindCollection()
        viewModel.loadAlbumsInfo()
    }
    func handleUI(){
        searchContainerStack.layer.cornerRadius = 10
        searchContainerStack.layer.masksToBounds = true
        albumName.text = albumTitle ?? ""
    }
    func bindCollection(){
        self.albumsImages.register(UINib(nibName: "AlbumPhotoCell", bundle: nil), forCellWithReuseIdentifier: "AlbumPhotoCell")
        viewModel.albumsInfo.bind(to: albumsImages.rx.items(cellIdentifier: "AlbumPhotoCell", cellType: AlbumPhotoCell.self)){index , item , cell in
            cell.imgURL  = URL(string: item.thumbnailURL ?? "")
            
        }
    }
}
