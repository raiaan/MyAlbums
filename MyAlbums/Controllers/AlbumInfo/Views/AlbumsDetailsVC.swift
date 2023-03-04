//
//  AlbumsDetailsVC.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/3/23.
//

import UIKit
import RxCocoa
import RxSwift
class AlbumsDetailsVC: UIViewController {
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var searchBar:UISearchBar!
    @IBOutlet weak var albumsImages: UICollectionView!
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
        bindSearch()
    }
    func handleUI(){
        
        albumName.text = albumTitle ?? ""
    }
    func bindCollection(){
        self.albumsImages.register(UINib(nibName: "AlbumPhotoCell", bundle: nil), forCellWithReuseIdentifier: "AlbumPhotoCell")
        viewModel.filtersAlbumsInfo.bind(to: albumsImages.rx.items(cellIdentifier: "AlbumPhotoCell", cellType: AlbumPhotoCell.self)){index , item , cell in
            cell.imgURL  = URL(string: item.thumbnailURL ?? "")
        }
    }
    func bindSearch(){
        searchBar.rx.text
            .orEmpty
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind{[unowned self] query in
                self.viewModel.searchFunction(query: query)
            }
    }
}
