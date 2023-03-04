//
//  AlbumPhotoCell.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/4/23.
//

import UIKit
import SDWebImage
class AlbumPhotoCell: UICollectionViewCell {

    @IBOutlet weak var albumImage: UIImageView!
    var imgURL:URL?{
        didSet{
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateView(){
        albumImage.sd_setImage(with: imgURL, placeholderImage: UIImage(systemName: "photo.artframe"))
    }

}
